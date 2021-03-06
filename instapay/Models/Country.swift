//
//  DropDownItem.swift
//  instapay
//
//  Created by Osama on 6/6/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//

import Foundation

struct Country: Decodable {
    var name: String?
    var code: String?
    
    enum CodingKeys: String, CodingKey {
       case name
       case code = "alpha-3"
    }

}

extension Country: DropDownItemProtocol {
    var title: String? {
        return name
    }
    
    var value: String? {
        return code
    }
    
}
