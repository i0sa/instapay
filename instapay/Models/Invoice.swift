//
//  Invoice.swift
//  instapay
//
//  Created by Osama on 6/6/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//

import Foundation
import UIKit

struct Invoice {
      
    var amount: Float
    var customerTitle: String
    
    var firstName: String
    var lastName:String
    var CurrencyCode: String
    var TaxAmount: Float
    var SDKLanguage: String
    var ShippingAddress: String
    var ShippingCity: String
    var ShippingState: String
    var ShippingCountry: String
    var ShippingZIPCode: String
    
    var BillingAddress: String
    var BillingCity: String
    var BillingCountry: String
    var BillingState: String
    var BillingZIPCode: String
    var OrderId: String
    var PhoneNumber: String
    var CustomerEmail: String
    var IsTokenization: Bool
    var IsPreAuth: Bool
    
    var MerchantEmail: String
    var MerchantSecretKey: String
    var AssigneeCode: String
    var ThemeColor: UIColor
    var IsThemeColorLight: Bool
    
    init() {
        // default values
        self.amount = 0
        self.customerTitle = "Order for awesome service"
        self.firstName = ""
        self.lastName = ""
        self.CurrencyCode = ""
        self.TaxAmount = 0
        self.SDKLanguage = "en"
        self.ShippingAddress = ""
        self.ShippingCity = ""
        self.ShippingState = ""
        self.ShippingCountry = ""
        self.ShippingZIPCode = ""
        self.BillingAddress = ""
        self.BillingCity = ""
        self.BillingCountry = ""
        self.BillingState = ""
        self.BillingZIPCode = ""
        self.OrderId = "\(CGFloat.random(in: 1000000...9999999))"
        self.PhoneNumber = ""
        self.CustomerEmail = ""
        self.IsTokenization = true
        
        // Pre-Auth is off cus it requires PayTaps to activate it manually
        self.IsPreAuth = false
        self.MerchantEmail = ""
        self.MerchantSecretKey = ""
        self.AssigneeCode = "SDK"
        self.ThemeColor = .red
        self.IsThemeColorLight = true
        self.setupMerchantDetails()

    }
//    
//    init(amount: Float, customerTitle: String, CurrencyCode: String, TaxAmount: Float, SDKLanguage: String, ShippingAddress: String, ShippingCity: String, ShippingState: String, ShippingCountry: String, ShippingZIPCode: String, BillingAddress: String, BillingCity: String, BillingCountry: String, BillingState: String, BillingZIPCode: String, OrderId: String, PhoneNumber: String, CustomerEmail: String, IsTokenization: Bool, IsPreAuth: Bool, MerchantEmail: String, MerchantSecretKey: String, AssigneeCode: String, ThemeColor: UIColor, IsThemeColorLight: Bool) {
//        self.amount = amount
//        self.customerTitle = customerTitle
//        self.CurrencyCode = CurrencyCode
//        self.TaxAmount = TaxAmount
//        self.SDKLanguage = SDKLanguage
//        self.ShippingAddress = ShippingAddress
//        self.ShippingCity = ShippingCity
//        self.ShippingState = ShippingState
//        self.ShippingCountry = ShippingCountry
//        self.ShippingZIPCode = ShippingZIPCode
//        self.BillingAddress = BillingAddress
//        self.BillingCity = BillingCity
//        self.BillingCountry = BillingCountry
//        self.BillingState = BillingState
//        self.BillingZIPCode = BillingZIPCode
//        self.OrderId = OrderId
//        self.PhoneNumber = PhoneNumber
//        self.CustomerEmail = CustomerEmail
//        self.IsTokenization = IsTokenization
//        self.IsPreAuth = IsPreAuth
//        self.MerchantEmail = ""
//        self.MerchantSecretKey = ""
//        self.AssigneeCode = AssigneeCode
//        self.ThemeColor = ThemeColor
//        self.IsThemeColorLight = IsThemeColorLight
//        self.setupMerchantDetails()
//      }
    
    // this is typically not a secure practice.. at all..
    // should be done from backend, but it's a task after all..
    mutating func setupMerchantDetails(){
        self.MerchantEmail = "me@i0sa.com"
        self.MerchantSecretKey = ""
    }

}
