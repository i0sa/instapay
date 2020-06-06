//
//  PTTokenizableUser.swift
//  instapay
//
//  Created by Osama on 6/6/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//  Payments Taps tokenization user

import Foundation

struct PTTokenizableUser: Codable {
    var firstName:String?
    var lastName:String?
    var email: String?
    var password: String?
    var token: String?
}
