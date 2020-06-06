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
    
    // this is typically not a secure practice.. at all..
    // should be done from backend, but it's a task after all..
    mutating func setupMerchantDetails(){
        self.MerchantEmail = "me@i0sa.com"
        self.MerchantSecretKey = "C3jVTCkDYHncC4J7qZdyU7Rayw8t8V3KYnGSZ0vXISalXUtoTGWOOOZmk7Qs2Ud1hTTgUpeDioYfjrEc8B0WpZjJ69c94palj3Cd"
    }

}



extension Invoice: Codable{
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        amount = try container.decode(Float.self, forKey: .amount)
        customerTitle = try container.decode(String.self, forKey: .customerTitle)
        firstName = try container.decode(String.self, forKey: .firstName)
        lastName = try container.decode(String.self, forKey: .lastName)
        CurrencyCode = try container.decode(String.self, forKey: .CurrencyCode)
        TaxAmount = try container.decode(Float.self, forKey: .TaxAmount)
        SDKLanguage = try container.decode(String.self, forKey: .SDKLanguage)
        ShippingAddress = try container.decode(String.self, forKey: .ShippingAddress)
        ShippingCity = try container.decode(String.self, forKey: .ShippingCity)
        ShippingState = try container.decode(String.self, forKey: .ShippingState)
        ShippingCountry = try container.decode(String.self, forKey: .ShippingCountry)
        ShippingZIPCode = try container.decode(String.self, forKey: .ShippingZIPCode)
        BillingAddress = try container.decode(String.self, forKey: .BillingAddress)
        BillingCity = try container.decode(String.self, forKey: .BillingCity)
        BillingCountry = try container.decode(String.self, forKey: .BillingCountry)
        BillingState = try container.decode(String.self, forKey: .BillingState)
        BillingZIPCode = try container.decode(String.self, forKey: .BillingZIPCode)
        OrderId = try container.decode(String.self, forKey: .OrderId)
        PhoneNumber = try container.decode(String.self, forKey: .PhoneNumber)
        CustomerEmail = try container.decode(String.self, forKey: .CustomerEmail)
        IsTokenization = try container.decode(Bool.self, forKey: .IsTokenization)
        IsPreAuth = try container.decode(Bool.self, forKey: .IsPreAuth)
        MerchantEmail = try container.decode(String.self, forKey: .MerchantEmail)
        MerchantSecretKey = try container.decode(String.self, forKey: .MerchantSecretKey)
        AssigneeCode = try container.decode(String.self, forKey: .AssigneeCode)
        ThemeColor = .red
        IsThemeColorLight = try container.decode(Bool.self, forKey: .IsThemeColorLight)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(amount, forKey: .amount)
        try container.encode(customerTitle, forKey: .customerTitle)
        try container.encode(firstName, forKey: .firstName)
        try container.encode(lastName, forKey: .lastName)
        try container.encode(CurrencyCode, forKey: .CurrencyCode)
        try container.encode(TaxAmount, forKey: .TaxAmount)
        try container.encode(SDKLanguage, forKey: .SDKLanguage)
        try container.encode(ShippingAddress, forKey: .ShippingAddress)
        try container.encode(ShippingCity, forKey: .ShippingCity)
        try container.encode(ShippingState, forKey: .ShippingState)
        try container.encode(ShippingCountry, forKey: .ShippingCountry)
        try container.encode(ShippingZIPCode, forKey: .ShippingZIPCode)
        try container.encode(BillingAddress, forKey: .BillingAddress)
        try container.encode(BillingCity, forKey: .BillingCity)
        try container.encode(BillingCountry, forKey: .BillingCountry)
        try container.encode(BillingState, forKey: .BillingState)
        try container.encode(BillingZIPCode, forKey: .BillingZIPCode)
        try container.encode(OrderId, forKey: .OrderId)
        try container.encode(PhoneNumber, forKey: .PhoneNumber)
        try container.encode(CustomerEmail, forKey: .CustomerEmail)
        try container.encode(IsTokenization, forKey: .IsTokenization)
        try container.encode(IsPreAuth, forKey: .IsPreAuth)
        try container.encode(MerchantEmail, forKey: .MerchantEmail)
        try container.encode(MerchantSecretKey, forKey: .MerchantSecretKey)
        try container.encode(AssigneeCode, forKey: .AssigneeCode)
        try container.encode(IsThemeColorLight, forKey: .IsThemeColorLight)
    }
    
    
    enum CodingKeys: String, CodingKey {
        
       case amount, customerTitle,firstName,lastName,CurrencyCode,TaxAmount,
        SDKLanguage,
        ShippingAddress,
        ShippingCity,
        ShippingState,
        ShippingCountry,
        ShippingZIPCode,
        BillingAddress,
        BillingCity,
        BillingCountry,
        BillingState,
        BillingZIPCode,
        OrderId,
        PhoneNumber,
        CustomerEmail,
        IsTokenization,
        IsPreAuth,
        MerchantEmail,
        MerchantSecretKey,
        AssigneeCode,
        ThemeColor,
        IsThemeColorLight

    }
}
