//
//  Form.swift
//  instapay
//
//  Created by Osama on 6/5/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//

import Foundation

class CheckoutForm {
    var formItems = [FormItem]()
    private var currenciesHelper: CurrenciesHelper
    private var countriesHelper: CountriesHelper

    var title: String
    var invoice = Invoice()
    
    func isValid() -> (Bool, String?) {
      
      var isValid = true
      for item in self.formItems {
        item.checkValidity()
        if !item.isValid {
          isValid = false
        }
      }
      return (isValid, nil)
    }
    
    init(currenciesHelper: CurrenciesHelper = CurrenciesHelper(),
        countriesHelper: CountriesHelper = CountriesHelper()
    ) {
        self.countriesHelper = countriesHelper
        self.currenciesHelper = currenciesHelper
        self.title = "PayTaps Checkout Form"
        self.configureItems()
    }
    
    private func configureItems() {
        let items = CheckoutFormConfigurator.allCases
        for item in items{
            self.formItems.append(item.formItem)
        }
//        // Username
//        let usernameItem = FormItem(mainTitle: "Username", placeholder: "Enter your username")
//        usernameItem.UIProperties.cellType = .textField
//        usernameItem.UIProperties.keyboardType = .numberPad
//        usernameItem.value = self.invoice.BillingAddress
//        usernameItem.valueCompletion = { [weak self, weak usernameItem] value in
//            if let value = value{
//                self?.invoice.BillingAddress = value
//            }
//            usernameItem?.value = value
//        }
//
//        // country
//        let CountryItem = FormItem(mainTitle: "Country", placeholder: "Select your country")
//        let countries = countriesHelper.countries()
//        CountryItem.UIProperties.cellType = .dropDown(items: countries)
//        CountryItem.value = self.invoice.BillingCountry
//        CountryItem.valueCompletion = { [weak self, weak CountryItem] value in
//            self?.invoice.BillingCountry = value ?? ""
//            CountryItem?.value = value
//        }
//
//
//        // currency
//        let currencyItem = FormItem(mainTitle: "Currency", placeholder: "Select your favorite currency")
//        let currencies = currenciesHelper.currencies()
//        currencyItem.UIProperties.cellType = .dropDown(items: currencies)
//        currencyItem.value = self.currency
//        currencyItem.valueCompletion = { [weak self, weak currencyItem] value in
//            self?.currency = value
//            currencyItem?.value = value
//        }
//
//
//        // set all
//        self.formItems = [usernameItem, CountryItem, currencyItem]
    }
}
