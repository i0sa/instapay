//
//  APIRouter.swift
//  instapay
//
//  Created by Osama on 6/6/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//
import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    
    case TokenizableTransaction(invoice: Invoice, TokenizableUser: PTTokenizableUser)
    
    
    var path: String {
        switch self {
        case .TokenizableTransaction:
            return "tokenized_transaction_prepare"
        }
    }
    
    
    var method: HTTPMethod {
        switch self {
        case .TokenizableTransaction:
            return .post
        }
    }
    

    var parameters: Parameters? {
        switch self {
        case .TokenizableTransaction(let invoice, _):
            return [
                "merchant_email": invoice.MerchantEmail,
                
            ]
        }
    }
    
    
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.baseURL.asURL().appendingPathComponent(path)
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        // Common Headers
        request.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        
        request.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        var params: [String: Any] = [:]
        if let parameters = parameters {
            // quick merge !
            parameters.forEach { (key, value) in params[key] = value }
        }
        return try URLEncoding.default.encode(request, with: params)
    }
    
    
}
