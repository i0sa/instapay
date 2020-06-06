//
//  CountriesHelper.swift
//  instapay
//
//  Created by Osama on 6/6/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//

import Foundation

class CountriesHelper{
    func countries() -> [Country] {
        let bundle = Bundle(url: Bundle.main.url(forResource: "Resources", withExtension: "bundle")!)
        if let path = bundle?.path(forResource: "countries", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([Country].self, from: data)
                return jsonData
            } catch {
//                return [Currency(title: "NIL", value: "NIL")]
                // handle error
            }
        }
        return [Country(name: "NIL", code: "NIL")]
    }
}
