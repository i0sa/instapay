//
//  FormTextFieldCell.swift
//  instapay
//
//  Created by Osama on 6/5/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//

import Foundation
import DropDown

class FormDropDownCell: UITableViewCell, FormCellProtocol {
    var items: [DropDownItemProtocol]?{
        didSet{
            if let items = items {
                dropDown.dataSource = items.map({ (item) in
                    return item.title ?? ""
                })
            }
        }
    }
    let dropDown = DropDown()

    lazy var field: UITextField = {
        let textField = UITextField()
//        textField.placeholder = "heyyy"
        textField.layer.masksToBounds = true
        textField.borderStyle = .none
        textField.backgroundColor = .clear
        textField.isUserInteractionEnabled = false
        
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
    lazy var arrowDownImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "arrowDown")
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        return imageView
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
        dropDown.anchorView = fieldContainer // UIView or UIBarButtonItem
        dropDown.dismissMode = .manual
        dropDown.bottomOffset = CGPoint(x: 0, y:65)
        // The list of items to display. Can be changed dynamically
        dropDown.selectionAction = { [weak self] (index: Int, item: String) in
            // set value should be the value in model
            // ie : currency EG
            self?.formItem?.valueCompletion?(self?.items?[index].value ?? "")
            self?.field.text = item
        }
        self.backgroundColor = .clear
        selectionStyle = .none

        self.addSubview(fieldContainer)
        fieldContainer.addSubview(field)
        fieldContainer.addSubview(arrowDownImage)
        self.addSubview(topLabel)
        field.translatesAutoresizingMaskIntoConstraints = false
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        fieldContainer.translatesAutoresizingMaskIntoConstraints = false
        arrowDownImage.translatesAutoresizingMaskIntoConstraints = false
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
            field.bottomAnchor.constraint(equalTo: fieldContainer.bottomAnchor, constant: -5),
            
            // arrow image
            arrowDownImage.centerYAnchor.constraint(equalTo: fieldContainer.centerYAnchor),
            arrowDownImage.trailingAnchor.constraint(equalTo: fieldContainer.trailingAnchor, constant: -20),
            arrowDownImage.widthAnchor.constraint(equalToConstant: 25)
        
        ])
        
        // add gesture
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapOnContainerView(_:)))
        fieldContainer.addGestureRecognizer(tapGesture)
    }
    @objc func didTapOnContainerView(_ sender: Any) {
        dropDown.show()
    }
    
    func configure(with formItem: FormItem) {
        self.formItem = formItem
        self.field.placeholder = formItem.placeholder
        self.topLabel.text = formItem.mainTitle
        let bgColor: UIColor = self.formItem?.isValid  == false ? .red : #colorLiteral(red: 0.8941176471, green: 0.8980392157, blue: 0.9098039216, alpha: 1)
        self.fieldContainer.layer.borderColor = bgColor.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
