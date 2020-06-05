//
//  CheckoutFooterCell.swift
//  instapay
//
//  Created by Osama on 6/6/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//

import UIKit

class CheckoutFooterCell: UITableViewHeaderFooterView {
    lazy var button: UIButton = {
        let btn = UIButton(type: UIButton.ButtonType.custom)
        btn.setTitle("Proceed to Checkout", for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.3294117647, green: 0.4392156863, blue: 0.9450980392, alpha: 1)
        btn.layer.cornerRadius = 25
        btn.titleLabel?.font = UIFont.init(name: "Avenir-Heavy", size: 18)
        return btn
    }()

    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    private func setupViews(){
        let backgroundView = UIView(frame: .zero)
        backgroundView.backgroundColor = .clear
        self.backgroundView = backgroundView

        button.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(button)
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            button.heightAnchor.constraint(equalToConstant: 60)

        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
