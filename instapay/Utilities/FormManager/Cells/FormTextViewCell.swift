//
//  FormTextViewCell.swift
//  instapay
//
//  Created by Osama on 6/5/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//

import Foundation

class FormTextViewCell: UITableViewCell, FormCellProtocol, UITextViewDelegate {
    lazy var textView: UITextView = {
        let textV = UITextView()
//        textField.placeholder = "heyyy"
        textV.delegate = self
        textV.layer.masksToBounds = true
        textV.backgroundColor = .clear
        
        return textV
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
//        label.text = "Total Price"
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
//        self.textView.addTarget(self, action: #selector(textFieldDidChanged(_:)), for: .editingChanged)

        self.addSubview(fieldContainer)
        fieldContainer.addSubview(textView)
        self.addSubview(topLabel)
        textView.translatesAutoresizingMaskIntoConstraints = false
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
            fieldContainer.heightAnchor.constraint(equalToConstant: 80),

            // field itself
            textView.topAnchor.constraint(equalTo: fieldContainer.topAnchor, constant: 5),
            textView.leadingAnchor.constraint(equalTo: fieldContainer.leadingAnchor, constant: 13),
            textView.trailingAnchor.constraint(equalTo: fieldContainer.trailingAnchor, constant: -13),
            textView.bottomAnchor.constraint(equalTo: fieldContainer.bottomAnchor, constant: -5)
        
        ])
    }
    


    func textViewDidChange(_ textView: UITextView) { //Handle the text changes here
        self.formItem?.valueCompletion?(textView.text)
    }
    
    func configure(with formItem: FormItem) {
        self.textView.text = formItem.value
        self.formItem = formItem
//        self.field.placeholder = formItem.placeholder
        self.topLabel.text = formItem.mainTitle
        if(self.formItem?.isValid == false){
            self.fieldContainer.layer.borderColor = UIColor.red.cgColor
            AnimationsFactory.addAnimations(self, animations: [.redBorder, .shake])
        } else {
            self.fieldContainer.layer.borderColor = #colorLiteral(red: 0.8941176471, green: 0.8980392157, blue: 0.9098039216, alpha: 1)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
