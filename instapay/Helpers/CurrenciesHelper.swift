
//
//  CurrenciesHelper.swift
//  instapay
//
//  Created by Osama on 6/6/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//

import Foundation

class CurrenciesHelper{
    static func currencies() -> [Currency] {
        let bundle = Bundle(url: Bundle.main.url(forResource: "Resources", withExtension: "bundle")!)
        if let path = bundle?.path(forResource: "currencies", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([Currency].self, from: data)
                return jsonData
            } catch {
//                return [Currency(title: "NIL", value: "NIL")]
                // handle error
            }
        }
        return [Currency(code: "NIL", name: "NIL")]
    }
}
