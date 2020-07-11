//
//  HomeViewController.swift
//  HomeWork9
//
//  Created by Maxim Andryushin on 10.07.2020.
//  Copyright © 2020 Maxim Andryushin. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    private enum Locals {
        static let heightOfStack: CGFloat = 400
        static let fontSize: CGFloat = 40
        static let cellHeight: CGFloat = 60
        static let logoutText = "LOG OUT"
        static let deleteText = "DELETE USER INFO"
    }
    
    private var nameLabel: UILabel!
    private var passwordLabel: UILabel!
    private var logoutButton: UIButton!
    private var deleteInfoButton: UIButton!
    private var stack: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        configureStackView(user: UserDefaultDataManager.getUserDetails()!)
    }
    
    private func configureStackView(user: UserDefaultDataManager.UserDetails) {
        nameLabel = ViewBuilder.configureLabel("Hello, \(user.login)", fontSize: Locals.fontSize)
        
        passwordLabel = ViewBuilder.configureLabel("Your password is \'\(user.password)\'", fontSize: Locals.fontSize)
        
        logoutButton = ViewBuilder.configureButton(Locals.logoutText, action: #selector(logout))
        
        deleteInfoButton = ViewBuilder.configureButton(Locals.deleteText, action: #selector(deleteInfo))
        
        stack = UIStackView()
        stack.alignment = .center
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        view.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        ViewBuilder.configureSubview(view: nameLabel, height: Locals.cellHeight, superView: stack)
        ViewBuilder.configureSubview(view: passwordLabel, height: Locals.cellHeight, superView: stack)
        ViewBuilder.configureSubview(view: logoutButton, height: Locals.cellHeight, superView: stack)
        ViewBuilder.configureSubview(view: deleteInfoButton, height: Locals.cellHeight, superView: stack)

        NSLayoutConstraint.activate([
            stack.heightAnchor.constraint(equalToConstant: Locals.heightOfStack),
            stack.centerYAnchor.constraint(equalTo: view.compatibleSafeAreaLayoutGuide.centerYAnchor),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    @objc private func logout() {
        UserDefaultDataManager.deauthenficate()
        AppDelegate.shared.rootViewController.loadView(LoginViewController())
    }
    
    @objc private func deleteInfo() {
        UserDefaultDataManager.clearUserData()
        logout()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
