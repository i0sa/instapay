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
        switch self {
            
        case .FirstName:
            var UIProperties = FormItemUI()
            UIProperties.cellType = FormItemCellType.textField
            return FormItem(mainTitle: "First Name",
                            placeholder: "Write your first name here",
                            UIProperties: UIProperties, isMandatory: true)
        case .LastName:
            var UIProperties = FormItemUI()
            UIProperties.cellType = FormItemCellType.textField
            return FormItem(mainTitle: "Last Name",
                            placeholder: "Write your last name here",
                            UIProperties: UIProperties, isMandatory: true)
        case .Email:
            var UIProperties = FormItemUI()
            UIProperties.keyboardType = .emailAddress
            UIProperties.cellType = FormItemCellType.textField
            return FormItem(mainTitle: "Email Address",
                            placeholder: "Write your valid email",
                            UIProperties: UIProperties, isMandatory: true)
        case .PhoneNumber:
            var UIProperties = FormItemUI()
            UIProperties.cellType = FormItemCellType.textField
            UIProperties.keyboardType = .phonePad
            return FormItem(mainTitle: "Phone Number",
                            placeholder: "Write your valid number",
                            UIProperties: UIProperties, isMandatory: true)
        case .Currency:
            var UIProperties = FormItemUI()
            let currencies = CurrenciesHelper().currencies()

            UIProperties.cellType = .dropDown(items: currencies)
            return FormItem(mainTitle: "Currency",
                            placeholder: "Select your currency",
                            UIProperties: UIProperties, isMandatory: true)
        case .ShippingCountry:
            var UIProperties = FormItemUI()
            let countries = CountriesHelper().countries()

            UIProperties.cellType = .dropDown(items: countries)
            return FormItem(mainTitle: "Country",
                            placeholder: "Select your country here",
                            UIProperties: UIProperties, isMandatory: true)
        case .ShippingState:
            var UIProperties = FormItemUI()
            UIProperties.cellType = FormItemCellType.textField
//            UIProperties.keyboardType = .phonePad
            return FormItem(mainTitle: "State",
                            placeholder: "State the item will be shipped to",
                            UIProperties: UIProperties, isMandatory: true)
        case .ShippingZipCode:
            var UIProperties = FormItemUI()
            UIProperties.cellType = FormItemCellType.textField
            UIProperties.keyboardType = .numberPad
            return FormItem(mainTitle: "Zip Code",
                            placeholder: "Zip code the item will be shipped to",
                            UIProperties: UIProperties, isMandatory: true)
        case .ShippingAddress:
            var UIProperties = FormItemUI()
            UIProperties.cellType = FormItemCellType.textView
            return FormItem(mainTitle: "Address",
                            placeholder: "Write your shipping address",
                            UIProperties: UIProperties, isMandatory: true)
        case .ShippingCity:
            var UIProperties = FormItemUI()
            UIProperties.cellType = FormItemCellType.textField
            return FormItem(mainTitle: "City",
                            placeholder: "Write your shipping city",
                            UIProperties: UIProperties, isMandatory: true)
        case .BillingCountry:
            var UIProperties = FormItemUI()
            let countries = CountriesHelper().countries()

            UIProperties.cellType = .dropDown(items: countries)
            return FormItem(mainTitle: "Billing Country",
                            placeholder: "Select your billing country",
                            UIProperties: UIProperties, isMandatory: true)
        case .BillingState:
            var UIProperties = FormItemUI()
            UIProperties.cellType = FormItemCellType.textField
            return FormItem(mainTitle: "Billing State",
                            placeholder: "Write your billing state",
                            UIProperties: UIProperties, isMandatory: true)
        case .BillingZipCode:
            var UIProperties = FormItemUI()
            UIProperties.keyboardType = .numberPad
            UIProperties.cellType = FormItemCellType.textField
            return FormItem(mainTitle: "Billing Zip Code",
                            placeholder: "Write your billing zip code",
                            UIProperties: UIProperties, isMandatory: true)
        case .BillingAddress:
            var UIProperties = FormItemUI()
            UIProperties.cellType = FormItemCellType.textView
            return FormItem(mainTitle: "Billing Address",
                            placeholder: "Write your billing address",
                            UIProperties: UIProperties, isMandatory: true)
        case .BillingCity:
            var UIProperties = FormItemUI()
            UIProperties.cellType = FormItemCellType.textField
            return FormItem(mainTitle: "Billing City",
                            placeholder: "Write your billing city here",
                            UIProperties: UIProperties, isMandatory: true)

        }
    }
    
}
