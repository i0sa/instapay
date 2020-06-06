//
//  PaymentStateDelegate.swift
//  instapay
//
//  Created by Osama on 6/6/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//

import Foundation
protocol PaymentStateDelegate: class {
    func paymentStateDidChangeTo(_ state: PaymentState)
}
