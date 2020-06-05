//
//  FormValidable.swift
//  instapay
//
//  Created by Osama on 6/5/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//

import Foundation

protocol FormValidable {
    var isValid: Bool {get set}
    var isMandatory: Bool {get set}
    func checkValidity()
}
