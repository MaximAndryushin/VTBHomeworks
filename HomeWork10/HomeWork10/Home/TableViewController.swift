//
//  TableViewController.swift
//  HomeWork10
//
//  Created by Maxim Andryushin on 13.07.2020.
//  Copyright © 2020 Maxim Andryushin. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    
    // MARK: - Constants

    private enum Locals {
        static let cellID = "cell"
    }


    // MARK: - Properties

    private var cellModels: [Car] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    private var backButton: UIButton!
    
    //MARK: ~Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTableView()
        configureTableView()
        loadData()
    }
    
    
    // MARK: - Configurations
    
    private func createTableView() {
        tableView = UITableView()
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Locals.cellID)
    }
    
    private func loadData() {
        let user = DataManager.shared.getUser()
        cellModels = user?.cars?.allObjects as! [Car]
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellModels.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Locals.cellID, for: indexPath)
        cell.textLabel?.text = cellModels[indexPath.row].name
        return cell
    }

}
