//
//  TokenizableRequestHandler.swift
//  instapay
//
//  Created by Osama on 6/6/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//

import Foundation

protocol RequestHandler {
    func start()
}

class TokenizableRequestHandler: RequestHandler {
    weak var delegate: PaymentStateDelegate?
    var invoice: Invoice
    var user: PTTokenizableUser
    var network: NetworkClient
    
    init(delegate: PaymentStateDelegate,
         invoice: Invoice,
         user: PTTokenizableUser,
         network: NetworkClient = NetworkClient()) {
        self.delegate = delegate
        self.network = network
        self.invoice = invoice
        self.user = user
    }
    
    func start(){
        network.performRequest(TokenizableResponse.self, router: .TokenizableTransaction(invoice: invoice, TokenizableUser: user), success: { (data) in
            print(data)
        }) { (error) in
            print("network error..")
        }
    }
}
