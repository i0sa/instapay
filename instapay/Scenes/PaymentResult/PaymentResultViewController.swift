//
//  PaymentResultViewController.swift
//  instapay
//
//  Created by Osama on 6/6/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//

import UIKit

class PaymentResultViewController: UIViewController {
    
    var paymentStatus: PaymentState
    
    init(paymentStatus: PaymentState) {
        self.paymentStatus = paymentStatus
        super.init(nibName: nil, bundle: nil)
    }
        

    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        return stack
    }()
    
    lazy var statusImageView: UIImageView = {
        let imageV = UIImageView()
        imageV.image = UIImage(named: "error")
        imageV.contentMode = UIView.ContentMode.scaleAspectFit
        return imageV
    }()
    
    lazy var messageLabel: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.textColor = .black
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.9490196078, blue: 0.9607843137, alpha: 1)
        setupViews()
        setupForPaymentStatus(paymentStatus: paymentStatus)
    }

    func setupViews() {
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),

            statusImageView.heightAnchor.constraint(equalToConstant: 100)

        ])
        stackView.addArrangedSubview(statusImageView)
        stackView.addArrangedSubview(messageLabel)
    }
    
    
    func setupForPaymentStatus(paymentStatus: PaymentState?){
        switch paymentStatus {
        case .success(let message):
            statusImageView.image = UIImage(named: "success")
            messageLabel.text = message
        case .fail(let reason):
            statusImageView.image = UIImage(named: "error")
            messageLabel.text = reason
        default:
            break
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
