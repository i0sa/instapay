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
        case .TokenizableTransaction(let invoice, let tokenizableUser):
            return [
                "merchant_email": invoice.MerchantEmail,
                "secret_key": invoice.MerchantSecretKey,
                "title": invoice.customerTitle,
                "cc_first_name": tokenizableUser.firstName ?? "",
                "cc_last_name": tokenizableUser.lastName ?? "",
                "order_id": invoice.OrderId,
                "product_name": invoice.customerTitle,
                "customer_email": invoice.CustomerEmail,
                "phone_number": invoice.PhoneNumber,
                "amount": invoice.amount,
                "currency": invoice.CurrencyCode,
                "address_billing": invoice.BillingAddress,
                "state_billing": invoice.BillingState,
                "city_billing": invoice.BillingCity,
                "postal_code_billing": invoice.BillingZIPCode,
                "country_billing": invoice.BillingCountry,
                "address_shipping": invoice.ShippingAddress,
                "city_shipping": invoice.ShippingCity,
                "state_shipping": invoice.ShippingState,
                "postal_code_shipping": invoice.ShippingZIPCode,
                "country_shipping": invoice.ShippingCountry,
                "pt_token": tokenizableUser.token ?? "",
                "pt_customer_email": tokenizableUser.email ?? "",
                "pt_customer_password": tokenizableUser.password ?? "",

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
