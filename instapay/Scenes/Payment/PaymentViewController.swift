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

    var initialSetupViewController: PTFWInitialSetupViewController!
    lazy var loadingIndicator: UIActivityIndicatorView = {
        let loading = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        loading.hidesWhenStopped = true
        return loading
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
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
        
        self.initialSetupViewController.didReceiveFinishTransactionCallback = {(responseCode, result, transactionID, tokenizedCustomerEmail, tokenizedCustomerPassword, token, transactionState) in
            print("Response Code: \(responseCode)")
            print("Response Result: \(result)")
            
            // In Case you are using tokenization
            print("Tokenization Cutomer Email: \(tokenizedCustomerEmail)");
            print("Tokenization Customer Password: \(tokenizedCustomerPassword)");
            print("TOkenization Token: \(token)");
        }


    }
    
    init(invoice: Invoice) {
        self.invoice = invoice
        super.init(nibName: nil, bundle: nil)
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

