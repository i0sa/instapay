//
//  TotalPriceHeaderCell.swift
//  instapay
//
//  Created by Osama on 6/5/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//

import UIKit

class TotalPriceHeaderCell: UITableViewHeaderFooterView {
    lazy var topLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.text = "Total Price"
        label.backgroundColor = .clear
        label.textColor = #colorLiteral(red: 0.4784313725, green: 0.4862745098, blue: 0.4941176471, alpha: 1)
        label.font = UIFont.init(name: "Avenir-Heavy", size: 15)
        return label
    }()


    lazy var fullPrice: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 1
        label.textColor = #colorLiteral(red: 0.3294117647, green: 0.4392156863, blue: 0.9450980392, alpha: 1)
        label.font = UIFont.init(name: "HelveticaNeue-UltraLight", size: 60)
        return label
    }()
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)


        setupViews()
        setupWithPrice(price: 100)
    }
    
    private func setupViews(){
        let backgroundView = UIView(frame: .zero)
        backgroundView.backgroundColor = .clear
        self.backgroundView = backgroundView

        topLabel.translatesAutoresizingMaskIntoConstraints = false
        fullPrice.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(topLabel)
        self.addSubview(fullPrice)
        NSLayoutConstraint.activate([
            topLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            topLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
//            topLabel.heightAnchor.constraint(equalToConstant: 20),


            fullPrice.topAnchor.constraint(equalTo: topLabel.bottomAnchor),
            fullPrice.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            fullPrice.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
            
        ])
    }
    
    private func setupWithPrice(price: Double){
        self.fullPrice.text = "\(price)"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
