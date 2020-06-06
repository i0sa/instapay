//
//  FormTextFieldCell.swift
//  instapay
//
//  Created by Osama on 6/5/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//

import Foundation

class FormTextFieldCell: UITableViewCell, FormCellProtocol {
    lazy var field: UITextField = {
        let textField = UITextField()
//        textField.placeholder = "heyyy"
        textField.layer.masksToBounds = true
        textField.borderStyle = .none
        textField.backgroundColor = .clear
        
        return textField
    }()
    
    lazy var fieldContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = #colorLiteral(red: 0.8941176471, green: 0.8980392157, blue: 0.9098039216, alpha: 1)
        view.layer.cornerRadius = 6
        view.layer.borderWidth = 1
        return view
    }()
    
    lazy var topLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.text = "Total Price"
        label.backgroundColor = .clear
        label.textColor = #colorLiteral(red: 0.2533827424, green: 0.2586194277, blue: 0.264210999, alpha: 1)
        label.font = UIFont.init(name: "Avenir-Heavy", size: 17)
        return label
    }()

    
    var formItem: FormItem?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()

    }

    func setupViews(){
        self.backgroundColor = .clear
        selectionStyle = .none
        self.field.addTarget(self, action: #selector(textFieldDidChanged(_:)), for: .editingChanged)

        self.addSubview(fieldContainer)
        fieldContainer.addSubview(field)
        self.addSubview(topLabel)
        field.translatesAutoresizingMaskIntoConstraints = false
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        fieldContainer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            // Top Label
            topLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            topLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            topLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),

            // field container
            fieldContainer.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 3),
            fieldContainer.leadingAnchor.constraint(equalTo: topLabel.leadingAnchor),
            fieldContainer.trailingAnchor.constraint(equalTo: topLabel.trailingAnchor),
            fieldContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            fieldContainer.heightAnchor.constraint(equalToConstant: 60),

            // field itself
            field.topAnchor.constraint(equalTo: fieldContainer.topAnchor, constant: 5),
            field.leadingAnchor.constraint(equalTo: fieldContainer.leadingAnchor, constant: 20),
            field.trailingAnchor.constraint(equalTo: fieldContainer.trailingAnchor, constant: -20),
            field.bottomAnchor.constraint(equalTo: fieldContainer.bottomAnchor, constant: -5)
        
        ])
    }
    
    @objc func textFieldDidChanged(_ textField: UITextField) {
        self.formItem?.valueCompletion?(textField.text)
    }

    func configure(with formItem: FormItem) {
        self.formItem = formItem
        self.field.placeholder = formItem.placeholder
        self.field.keyboardType = formItem.UIProperties.keyboardType
        self.topLabel.text = formItem.mainTitle
        let bgColor: UIColor = self.formItem?.isValid  == false ? .red : #colorLiteral(red: 0.8941176471, green: 0.8980392157, blue: 0.9098039216, alpha: 1)
        self.fieldContainer.layer.borderColor = bgColor.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
