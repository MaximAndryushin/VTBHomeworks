//
//  ViewController.swift
//  HomeWork6
//
//  Created by Maxim Andryushin on 03.07.2020.
//  Copyright © 2020 Maxim Andryushin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Constants

    private enum Locals {
        static let cellID = "cell"
        static let cellHeight: CGFloat = 100
        static let positionOfTableX: CGFloat = 0
        static let positionOfTableY: CGFloat = 0
        static let colorOfHeader: UIColor = .darkGray
        static let colorOfFooter: UIColor = .darkGray
    }


    // MARK: - Properties

    private var tableView: UITableView!
    private var cellModels: [Person] = [] {
        didSet {
            tableView.reloadData()
        }
    }


    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        createTableView()
        configureTableView()
        loadData()
    }


    // MARK: - Configurations
    
    private func createTableView() {
        tableView = UITableView()
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableOfPersons.self, forCellReuseIdentifier: Locals.cellID)
    }

    private func loadFile(pathName: URL) {
        do {
            let jsonData = try Data(contentsOf: pathName)
            let decoder = JSONDecoder()
            cellModels = try decoder.decode([Person].self, from: jsonData)
        } catch {
            print(error)
        }
    }

    private func loadData() {
        guard let mainUrl = Bundle.main.url(forResource: "data", withExtension: "json") else { return }
        loadFile(pathName: mainUrl)
    }
}


// MARK: - UITableViewDelegate & UITableViewDataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Locals.cellID, for: indexPath) as? TableOfPersons {
            cell.viewModel = cellModels[indexPath.row]
            return cell
        }
        
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Locals.cellHeight
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let foot = UIView();
        foot.backgroundColor = Locals.colorOfFooter
        return foot
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let head = UIView();
        head.backgroundColor = Locals.colorOfHeader
        return head;
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            tableView.beginUpdates()
            cellModels.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}

