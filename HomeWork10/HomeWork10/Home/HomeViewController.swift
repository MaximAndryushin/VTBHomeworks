//
//  HomeViewController.swift
//  HomeWork10
//
//  Created by Maxim Andryushin on 12.07.2020.
//  Copyright © 2020 Maxim Andryushin. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    private enum Locals {
        static let heightOfStack: CGFloat = 600
        static let fontSize: CGFloat = 40
        static let cellHeight: CGFloat = 60
        static let logoutText = "LOG OUT"
        static let deleteText = "DELETE USER INFO"
        static let addText = "+"
        static let listText = "LIST ALL CARS"
    }
    
    private var nameLabel: UILabel!
    private var passwordLabel: UILabel!
    private var logoutButton: UIButton!
    private var deleteInfoButton: UIButton!
    private var addButton: UIButton!
    private var listButton: UIButton!
    private var stack: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        configureStackView(user: DataManager.shared.getUser()!)
    }
    
    private func configureStackView(user: User) {
        
        stack = StackBuilder.createStack(height: Locals.heightOfStack, view: view)
        
        nameLabel = LabelBuilder.createLabel("Hello, \(user.name!)", fontSize: Locals.fontSize)
        
        passwordLabel = LabelBuilder.createLabel("Your password is \'\(user.password!)\'", fontSize: Locals.fontSize)
        
        logoutButton = ButtonBuilder.createButton(Locals.logoutText, action: #selector(logout))
        
        deleteInfoButton = ButtonBuilder.createButton(Locals.deleteText, action: #selector(deleteInfo))
        
        addButton = ButtonBuilder.createButton(Locals.addText, action: #selector(addCar))
        
        listButton = ButtonBuilder.createButton(Locals.listText, action: #selector(listCars))
        
        StackBuilder.addSubview(view: nameLabel, height: Locals.cellHeight, stack: stack)
        StackBuilder.addSubview(view: passwordLabel, height: Locals.cellHeight, stack: stack)
        StackBuilder.addSubview(view: logoutButton, height: Locals.cellHeight, stack: stack)
        StackBuilder.addSubview(view: deleteInfoButton, height: Locals.cellHeight, stack: stack)
        StackBuilder.addSubview(view: addButton, height: Locals.cellHeight, stack: stack)
        StackBuilder.addSubview(view: listButton, height: Locals.cellHeight, stack: stack)


    }
    
    @objc private func logout() {
        DataManager.shared.deauthenficate()
        AppDelegate.shared.rootViewController.loadView(LoginViewController())
    }
    
    @objc private func deleteInfo() {
        DataManager.shared.clearUserData()
        logout()
    }
    
    @objc private func addCar() {
        MyAlert.showAlertWithTextField(controller: self)
    }
    
    @objc private func listCars() {
        let embedController = TableViewController()
        embedController.view.frame = view.bounds
        self.present(embedController, animated: false, completion: nil)
    }
}
