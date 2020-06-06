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
    var responseCode: Int
    
    enum CodingKeys: String, CodingKey {
        case transactionId = "transaction_id"
        case result
        case responseCode = "response_code"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        transactionId = try? container.decode(Int?.self, forKey: .transactionId)
        result = try container.decode(String?.self, forKey: .result)
        
        // manually converting it to Int, because it is String in response
        if let responseC = try container.decode(String?.self, forKey: .responseCode),
            let responseCodeInt = Int(responseC){
            responseCode = responseCodeInt
        } else {
            responseCode = 0
        }

    }

}


