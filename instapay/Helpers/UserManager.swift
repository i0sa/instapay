//
//  UserManager.swift
//  instapay
//
//  Created by Osama on 6/6/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//

import Foundation
import KeychainSwift

class UserManager{
    private let keychain = KeychainSwift()
    private let userDefaults = UserDefaults.standard
    private let UserKey = "user"
    private let InvoiceKey = "invoice"

    func storeUserData(firstName: String, lastName: String, email: String, password: String, token: String){
        let user = PTTokenizableUser(firstName: firstName, lastName: lastName, email: email, password: password, token: token)
        if let encodedUser = try? JSONEncoder().encode(user){
            keychain.set(encodedUser, forKey: "user")
        }
    }
    
    func storeInvoice(invoice: Invoice){
        if let encodedInvoice = try? JSONEncoder().encode(invoice){
            userDefaults.set(encodedInvoice, forKey: InvoiceKey)
        }
    }
    
    
    var user: PTTokenizableUser? {
        get {
            if let userData = keychain.getData(UserKey) {
                return try? JSONDecoder().decode(PTTokenizableUser.self, from: userData)
            }
            return nil
        }
    }
    
    var lastInvoice: Invoice? {
        get {
            if let invoiceData = userDefaults.value(forKey: InvoiceKey) as? Data {
                do{
                    return try JSONDecoder().decode(Invoice.self, from: invoiceData)
                } catch let error{
                    print("error \(error)")
                }
            }
            return nil
        }
    }
    
    var isTokenizable: Bool {
        get {
            return user != nil
        }
    }
    
    func logout(){
        keychain.delete(UserKey)
    }
}
