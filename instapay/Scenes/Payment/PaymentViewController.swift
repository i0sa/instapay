//
//  PaymentViewController.swift
//  instapay
//
//  Created by Osama on 6/6/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//

import UIKit

// This is a wrapper for the payment implementation
class PaymentViewController: UIViewController {
    weak var delegate: PaymentStateDelegate?
    var invoice: Invoice
    let userManager: UserManager
    var network: NetworkClient

    
    var initialSetupViewController: PTFWInitialSetupViewController!
    
    init(invoice: Invoice, userManager: UserManager = UserManager(), network: NetworkClient = NetworkClient()) {
        self.invoice = invoice
        self.userManager = userManager
        self.network = network
        super.init(nibName: nil, bundle: nil)
    }
    
    
    lazy var loadingIndicator: UIActivityIndicatorView = {
        let loading = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        loading.hidesWhenStopped = true
        return loading
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupViews()
        
        if(userManager.isTokenizable){
            tokenizableTransactionHandler()
        } else {
            normalTransactionHandler()
        }
    }
    
    func validateResponseCode(code: Int) -> Bool{
        let successCodes = [100, 111, 112, 113, 115, 116]
        if(successCodes.contains(code)){
            return true
        }
        return false
    }
    
    func tokenizableTransactionHandler(){
        if let user = userManager.user {
            loadingIndicator.startAnimating()
            invoice.refreshOrderId()
            network.performRequest(TokenizableResponse.self, router: .TokenizableTransaction(invoice: invoice, TokenizableUser: user), success: { [weak self] (data) in
                if(self?.validateResponseCode(code: data.responseCode) == true){
                    self?.delegate?.paymentStateDidChangeTo(.success(message: data.result ?? ""))
                } else {
                    self?.delegate?.paymentStateDidChangeTo(.fail(reason: data.result ?? ""))
                }
                self?.dismiss(animated: true, completion: nil)
            }) { [weak self] (error) in
                self?.delegate?.paymentStateDidChangeTo(.fail(reason: "Network Error"))
                self?.dismiss(animated: true, completion: nil)
//                print("network error.. \(error)")
            }
        } else {
            self.dismiss(animated: true, completion: nil)
            delegate?.paymentStateDidChangeTo(.fail(reason: "No User Found"))
        }
    }

    func normalTransactionHandler(){
        let bundle = Bundle(url: Bundle.main.url(forResource: "Resources", withExtension: "bundle")!)
        self.initialSetupViewController = PTFWInitialSetupViewController.init(
        bundle: bundle,
        andWithViewFrame: self.view.frame,
        andWithAmount: invoice.amount,
        andWithCustomerTitle: invoice.customerTitle,
        andWithCurrencyCode: invoice.CurrencyCode,
        andWithTaxAmount: invoice.TaxAmount,
        andWithSDKLanguage: invoice.SDKLanguage,
        andWithShippingAddress: invoice.ShippingAddress,
        andWithShippingCity: invoice.ShippingCity,
        andWithShippingCountry: invoice.ShippingCountry,
        andWithShippingState: invoice.ShippingState,
        andWithShippingZIPCode: invoice.ShippingZIPCode,
        andWithBillingAddress: invoice.BillingAddress,
        andWithBillingCity: invoice.BillingCity,
        andWithBillingCountry: invoice.BillingCountry,
        andWithBillingState: invoice.BillingState,
        andWithBillingZIPCode: invoice.BillingZIPCode,
        andWithOrderID: invoice.OrderId,
        andWithPhoneNumber: invoice.PhoneNumber,
        andWithCustomerEmail: invoice.CustomerEmail,
        andIsTokenization: invoice.IsTokenization,
        andIsPreAuth: invoice.IsPreAuth,
        andWithMerchantEmail: invoice.MerchantEmail,
        andWithMerchantSecretKey: invoice.MerchantSecretKey,
        andWithAssigneeCode: invoice.AssigneeCode,
        andWithThemeColor: invoice.ThemeColor,
        andIsThemeColorLight: invoice.IsThemeColorLight
        )

        self.initialSetupViewController.didStartPreparePaymentPage = { [weak self] in
            self?.delegate?.paymentStateDidChangeTo(.loading)
            self?.loadingIndicator.startAnimating()
        }
        self.initialSetupViewController.didFinishPreparePaymentPage = { [weak self] in
          self?.delegate?.paymentStateDidChangeTo(.started)
          self?.loadingIndicator.stopAnimating()
        }
        
        self.initialSetupViewController.didReceiveBackButtonCallback = { [weak self] in
            self?.dismiss(animated: true, completion: nil)
        }
        
        self.initialSetupViewController.didReceiveFinishTransactionCallback = { [weak self] (responseCode, result, transactionID, tokenizedCustomerEmail, tokenizedCustomerPassword, token, transactionState) in
            
            if(self?.validateResponseCode(code: Int(responseCode)) == true){
                if(tokenizedCustomerEmail.count > 0){
                    self?.userManager.storeUserData(firstName: self?.invoice.firstName ?? "", lastName: self?.invoice.lastName ?? "", email: tokenizedCustomerEmail, password: tokenizedCustomerPassword, token: token)
                }
                self?.delegate?.paymentStateDidChangeTo(.success(message: result))
            } else {
                self?.delegate?.paymentStateDidChangeTo(.fail(reason: result))
            }
            self?.dismiss(animated: true, completion: nil)
            print("Response Code: \(responseCode)")
            print("Response Result: \(result)")
            // store in keychain
            // In Case you are using tokenization
            print("Tokenization Cutomer Email: \(tokenizedCustomerEmail)");
            print("Tokenization Customer Password: \(tokenizedCustomerPassword)");
            print("TOkenization Token: \(token)");
        }

        self.view.addSubview(initialSetupViewController.view)
        self.addChild(initialSetupViewController)
        
        initialSetupViewController.didMove(toParent: self)


    }
    
    func setupViews(){
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(loadingIndicator)
        NSLayoutConstraint.activate([
            loadingIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            loadingIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

