//
//  DropDownItem.swift
//  instapay
//
//  Created by Osama on 6/6/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//

import Foundation

struct Currency: Decodable {
    var code: String?
    var name: String?
}

extension Currency: DropDownItemProtocol {
    var title: String? {
        return name
    }
    
    var value: String? {
        return code
    }
    
    
}
