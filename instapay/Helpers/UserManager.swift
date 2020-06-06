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
    private let UserKey = "user"
    
    func storeUserData(firstName: String, lastName: String, email: String, password: String, token: String){
        let user = PTTokenizableUser(firstName: firstName, lastName: lastName, email: email, password: password, token: token)
        if let encodedUser = try? JSONEncoder().encode(user){
            keychain.set(encodedUser, forKey: "user")
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
    
    var isTokenizable: Bool {
        get {
            return user != nil
        }
    }
    
    func logout(){
        keychain.delete(UserKey)
    }
}
