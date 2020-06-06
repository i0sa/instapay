//
//  NetworkClient.swift
//  instapay
//
//  Created by Osama on 6/6/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//
import Foundation
import Alamofire

struct NetworkClient {
    
    typealias onSuccess<T> = ((T) -> ())
    typealias onFailure = ( (_ error: Error) -> ())
    
    // object parameter is added here so the T generic param can infer the type
    // All objects must conform to "Decodable" protocol
    func performRequest<T>(_ object: T.Type, router: APIRouter, success: @escaping onSuccess<T>, failure: @escaping onFailure) where T: Decodable{
        Alamofire.request(router).responseJSON { (response) in
            do {
                let Lists = try JSONDecoder().decode(T.self, from: response.data!)
                
                success(Lists)
            } catch let error{
                failure(error)
            }
        }
    }
}
