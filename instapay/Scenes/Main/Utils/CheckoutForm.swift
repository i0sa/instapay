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

    // default value, there's no normal cart behaviour to handle this, so i had it manually done.
    var value: Float = 493.53
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
    
    init() {
        self.title = "PayTaps Checkout Form"
        self.configureItems()
        self.invoice.amount = value
    }
    
    private func configureItems() {
        let items = CheckoutFormConfigurator.allCases
        for item in items{
            let formItem = item.formItem
            formItem.valueCompletion = { value in
                //            self?.currency = value
                formItem.value = value
                self.configureInvoiceValue(value: value, for: item, formItem: formItem)
            }
            self.formItems.append(formItem)
        }
    }
    
    func configureInvoiceValue(value: Any?, for item: CheckoutFormConfigurator, formItem: FormItem){
        switch item{
            
        case .FirstName:
            invoice.firstName = formItem.value ?? ""
        case .LastName:
            invoice.lastName = formItem.value ?? ""
        case .Email:
            invoice.CustomerEmail = formItem.value ?? ""
        case .PhoneNumber:
            invoice.PhoneNumber = formItem.value ?? ""
        case .Currency:
            invoice.CurrencyCode = formItem.value ?? ""
        case .ShippingCountry:
            invoice.ShippingCountry = formItem.value ?? ""
        case .ShippingState:
            invoice.ShippingState = formItem.value ?? ""
        case .ShippingZipCode:
            invoice.ShippingZIPCode = formItem.value ?? ""
        case .ShippingAddress:
            invoice.ShippingAddress = formItem.value ?? ""
        case .ShippingCity:
            invoice.ShippingCity = formItem.value ?? ""
        case .BillingCountry:
            invoice.BillingCountry = formItem.value ?? ""
        case .BillingState:
            invoice.BillingState = formItem.value ?? ""
        case .BillingZipCode:
            invoice.BillingZIPCode = formItem.value ?? ""
        case .BillingAddress:
            invoice.BillingAddress = formItem.value ?? ""
        case .BillingCity:
            invoice.BillingCity = formItem.value ?? ""
        }
    }
}
