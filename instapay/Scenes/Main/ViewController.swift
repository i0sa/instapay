//
//  ViewController.swift
//  instapay
//
//  Created by Osama on 6/5/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let form = Form()
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .clear
        return table
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        setupViews()
        // Do any additional setup after loading the view.
    }

    func setupViews() {
        FormItemCellType.registerCells(for: tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = self.view.bounds
        self.view.addSubview(tableView)
        
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = self.form.formItems[indexPath.row]
        let cell: UITableViewCell
        if let cellClass = item.UIProperties.cellType {
            cell = cellClass.dequeueCell(for: tableView, at: indexPath)
        } else {
            cell = UITableViewCell() //or anything you want
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

}
