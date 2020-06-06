//
//  CheckoutFormConfigurator.swift
//  instapay
//
//  Created by Osama on 6/6/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//

import Foundation

// this refers to the form fields, and configures them, as well as the use of "CaseIterable" to loop through all of them in the CheckoutForm itself

enum CheckoutFormConfigurator: CaseIterable {
    case FirstName
    case LastName

    case Email
    case PhoneNumber

    case Currency

    case ShippingCountry
    case ShippingState
    case ShippingZipCode
    case ShippingAddress
    case ShippingCity
    
    case BillingCountry
    case BillingState
    case BillingZipCode
    case BillingAddress
    case BillingCity


    var formItem: FormItem {
        let item = FormItem(mainTitle: "Currency", placeholder: "Select your favorite currency")
        let currencies = CurrenciesHelper().currencies()
        item.UIProperties.cellType = .dropDown(items: currencies)
        item.valueCompletion = { value in
//            self?.currency = value
            item.value = value
        }
        return item
    }
    
}
