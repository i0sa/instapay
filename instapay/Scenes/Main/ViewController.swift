//
//  ViewController.swift
//  instapay
//
//  Created by Osama on 6/5/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let form = CheckoutForm()
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .clear
        table.separatorStyle = .none
        table.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.9490196078, blue: 0.9607843137, alpha: 1)
        setupViews()

    }
    func registerCells(){
        tableView.registerCell(cellClass: TotalPriceHeaderCell.self)
        tableView.registerCell(cellClass: CheckoutFooterCell.self)
    }

    func setupViews() {
        // register cells related to form builder
        FormItemCellType.registerCells(for: tableView)
        // register internal cells
        registerCells()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = self.view.bounds
        self.view.addSubview(tableView)
        
    }
    
    @objc func didPressProceed(_ sender: UIButton){
        self.form.isValid()
        self.tableView.reloadData()
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return tableView.dequeue() as TotalPriceHeaderCell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let cell = tableView.dequeue() as CheckoutFooterCell
        cell.button.addTarget(self, action: #selector(didPressProceed(_:)), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = self.form.formItems[indexPath.row]
        let cell: UITableViewCell
        if let cellClass = item.UIProperties.cellType {
            cell = cellClass.dequeueCell(for: tableView, at: indexPath)
        } else {
            cell = UITableViewCell()
        }
        
        if let formUpdatableCell = cell as? FormCellProtocol {
            item.indexPath = indexPath
            formUpdatableCell.configure(with: item)
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.form.formItems.count
    }

}
