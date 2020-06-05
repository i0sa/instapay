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
    var placeholder = ""
    var indexPath: IndexPath?
    var valueCompletion: ((String?) -> Void)?
    var UIProperties = FormItemUI()
    
    init(placeholder: String, value: String? = nil) {
        self.placeholder = placeholder
        self.value = value
    }

}

extension FormItem: FormValidable {
    var isValid: Bool {
        get {
            return true
        }
        set {}
    }
    
    var isMandatory: Bool{
        get {
            return true
        }
        set {}
    }
    

    func checkValidity() {
        if self.isMandatory {
            self.isValid = self.value != nil && self.value?.isEmpty == false
        } else {
            self.isValid = true
        }
    }

}
