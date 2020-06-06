//
//  FormItem.swift
//  instapay
//
//  Created by Osama on 6/5/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//

import Foundation

class FormItem {
    var value: String?
    var mainTitle = ""
    var placeholder = ""
    
    // i may need to use indexpath to animate the view at any point from TableView..s
    var indexPath: IndexPath?
    var valueCompletion: ((String?) -> Void)?
    var UIProperties = FormItemUI()
    var isValid = true
    var isMandatory = true
    
    init(mainTitle: String,
         placeholder: String,
         UIProperties: FormItemUI,
         isMandatory: Bool,
         value: String? = nil) {
        self.placeholder = placeholder
        self.mainTitle = mainTitle
        self.UIProperties = UIProperties
        self.isMandatory = isMandatory
        self.value = value
    }

}

extension FormItem: FormValidable {

    func checkValidity() {
        if self.isMandatory {
            self.isValid = self.value != nil && self.value?.isEmpty == false
        } else {
            self.isValid = true
        }
    }

}
