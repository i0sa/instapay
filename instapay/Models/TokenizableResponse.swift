//
//  TokenizableResponse.swift
//  instapay
//
//  Created by Osama on 6/6/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//

import Foundation

struct TokenizableResponse: Codable {
    var transactionId: Int?
    var result: String?
    var responseCode: String?
    
    enum CodingKeys: String, CodingKey {
        case transactionId = "transaction_id"
        case result
        case responseCode = "response_code"
    }

}


