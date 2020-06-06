//
//  PaymentStates.swift
//  instapay
//
//  Created by Osama on 6/6/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//

import Foundation

enum PaymentState {
    case loading
    case started
    
    case success(message: String)
    case fail(reason: String)
}
