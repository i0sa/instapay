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
    
    var title: String?

    var username: String?
    var currency: String?
    var phoneNumber: String?
    
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
    
    init() {
      self.configureItems()
      self.title = "Amazing form"
    }
    
    private func configureItems() {
        
        // Username
        let usernameItem = FormItem(mainTitle: "Username", placeholder: "Enter your username")
        usernameItem.UIProperties.cellType = .textField
        usernameItem.UIProperties.keyboardType = .numberPad
        usernameItem.value = self.username
        usernameItem.valueCompletion = { [weak self, weak usernameItem] value in
            self?.username = value
            usernameItem?.value = value
        }

        // textview
        let currencyItem = FormItem(mainTitle: "Currency", placeholder: "Select your favorite currency")
        let currencies = CurrenciesHelper.currencies()
//        let items = [Country(title: "heYww", value:"k"), Country(title: "heY", value:"k")]
        currencyItem.UIProperties.cellType = .dropDown(items: currencies)
        currencyItem.value = self.currency
        currencyItem.valueCompletion = { [weak self, weak currencyItem] value in
            self?.currency = value
            currencyItem?.value = value
        }

        
        // set all
        self.formItems = [usernameItem, currencyItem]
    }
}
