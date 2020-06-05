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
    static func registerCells(for tableView: UITableView) {
        tableView.registerCell(cellClass: FormTextFieldCell.self)
//      tableView.register(cellType: FormTextViewTableViewCell.self)
    }
    
    /// Correctly dequeue the UITableViewCell according to the current cell type
    ///
    /// - Parameters:
    ///   - tableView: TableView where cells previously registered
    ///   - indexPath: indexPath where dequeue
    /// - Returns: a non-nullable UITableViewCell dequeued
    func dequeueCell(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
      
      let cell: UITableViewCell
      
      switch self {
      case .textView:
        cell = tableView.dequeue() as FormTextFieldCell
      case .textField:
        cell = tableView.dequeue() as FormTextFieldCell
      }
      
      return cell
    }

}
