//
//  FormTextFieldCell.swift
//  instapay
//
//  Created by Osama on 6/5/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//

import Foundation

class FormTextFieldTableViewCell: UITableViewCell, FormCellProtocol {
    lazy var field: UITextField = {
        return UITextField()
    }()
    
    var formItem: FormItem?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setupViews(){
        self.addSubview(field)
        self.field.addTarget(self, action: #selector(textFieldDidChanged(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChanged(_ textField: UITextField) {
        self.formItem?.valueCompletion?(textField.text)
    }

    func update(with formItem: FormItem) {
        self.formItem = formItem
        
        let bgColor: UIColor = self.formItem?.isValid  == false ? .red : .white
        
    }

}
