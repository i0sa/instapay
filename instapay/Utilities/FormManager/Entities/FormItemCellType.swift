//
//  FormItemCellTypes.swift
//  instapay
//
//  Created by Osama on 6/5/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//

import Foundation
import UIKit

enum FormItemCellType {
    case textField
    case textView
    case dropDown(items: [DropDownItem])
    
    static func registerCells(for tableView: UITableView) {
        tableView.registerCell(cellClass: FormTextFieldCell.self)
        tableView.registerCell(cellClass: FormTextViewCell.self)
        tableView.registerCell(cellClass: FormDropDownCell.self)
    }
    
    func dequeueCell(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
      
      var cell: UITableViewCell
      
      switch self {
      case .textView:
        cell = tableView.dequeue() as FormTextViewCell
      case .textField:
        cell = tableView.dequeue() as FormTextFieldCell
      case .dropDown(let items):
        let dropDownCell = tableView.dequeue() as FormDropDownCell
        dropDownCell.items = items
        
        cell = dropDownCell
      }
      
      return cell
    }

}
