//
//  UITableView+Extensions.swift
//  instapay
//
//  Created by Osama on 6/5/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//

import Foundation
    import UIKit

extension UITableView {
    
    func registerCell<Cell: UIView>(cellClass: Cell.Type){
        //MARK: Generic Register cells
        switch cellClass {
        case is UITableViewCell.Type:
            self.register(Cell.self, forCellReuseIdentifier: String(describing: Cell.self))
        case is UITableViewHeaderFooterView.Type:
            self.register(Cell.self, forHeaderFooterViewReuseIdentifier: String(describing: Cell.self))
        default:
            fatalError("Unknown registered cell type")
        }
    }
    
    
    func dequeue<Cell: UIView>() -> Cell{
        let identifier = String(describing: Cell.self)
        switch Cell.self {
        case is UITableViewCell.Type:
            guard let cell = self.dequeueReusableCell(withIdentifier: identifier) as? Cell else {
                fatalError("Error in cell")
            }
            return cell
        case is UITableViewHeaderFooterView.Type:
            guard let cell = self.dequeueReusableHeaderFooterView(withIdentifier: identifier) as? Cell else {
                fatalError("Error in cell")
            }
            return cell
        default:
            fatalError("Unknown registered cell type")
        }
    }
    
}
