//
//  FormCellProtocol.swift
//  instapay
//
//  Created by Osama on 6/5/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//

import Foundation
protocol FormCellProtocol {
    var formItem: FormItem? { get set }
    func update(with formItem: FormItem)
}
