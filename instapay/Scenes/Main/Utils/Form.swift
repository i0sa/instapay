//
//  Form.swift
//  instapay
//
//  Created by Osama on 6/5/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//

import Foundation

class Form {
    var formItems = [FormItem]()
    
    var title: String?

    var username: String?
    var mail: String?
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
        usernameItem.value = self.username
        usernameItem.valueCompletion = { [weak self, weak usernameItem] value in
            self?.username = value
            usernameItem?.value = value
        }

        // textview
        let addressItem = FormItem(mainTitle: "textView", placeholder: "Enter your username")
        addressItem.UIProperties.cellType = .dropDown
        addressItem.value = self.mail
        addressItem.valueCompletion = { [weak self, weak addressItem] value in
            self?.mail = value
            addressItem?.value = value
        }

        
        // set all
        self.formItems = [usernameItem, addressItem]
    }
}
