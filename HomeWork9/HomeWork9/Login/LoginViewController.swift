//
//  LoginViewController.swift
//  HomeWork9
//
//  Created by Maxim Andryushin on 10.07.2020.
//  Copyright © 2020 Maxim Andryushin. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: ~Constants
    private enum Locals {
        static let heightOfStack: CGFloat = 500
        static let buttonTitle = "SIGN IN"
        static let loginText = "Enter your username"
        static let passwordText = "Enter your password"
        static let registerText = "SIGN UP"
        static let deleteText = "DELETE"
        static let fontSize: CGFloat = 20
        static let heightOfStackSubview: CGFloat = 60
    }
    
    
    private var nameField: UITextField!
    private var passwField: UITextField!
    private var stack: UIStackView!
    private var button: UIButton!
    private var buttonRegister: UIButton!
    private var buttonDelete: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        configureStackView()
    }
    
    private func configureStackView() {
        
        stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .equalSpacing
        view.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stack.heightAnchor.constraint(equalToConstant: Locals.heightOfStack),
            stack.centerYAnchor.constraint(equalTo: view.compatibleSafeAreaLayoutGuide.centerYAnchor),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        nameField = ViewBuilder.configureField(Locals.loginText, fontSize: Locals.fontSize, view: self)
        passwField = ViewBuilder.configureField(Locals.loginText, fontSize: Locals.fontSize, view: self)
        
        ViewBuilder.configureSubview(view: nameField, height: Locals.heightOfStackSubview, superView: stack)
        ViewBuilder.configureSubview(view: passwField, height: Locals.heightOfStackSubview, superView: stack)
        
        button = ViewBuilder.configureButton(Locals.buttonTitle, action: #selector(self.buttonClicked))
        ViewBuilder.configureSubview(view: button, height: Locals.heightOfStackSubview, superView: stack)
        
        buttonRegister = ViewBuilder.configureButton(Locals.registerText, action: #selector(buttonRegisterClicked))
        ViewBuilder.configureSubview(view: buttonRegister, height: Locals.heightOfStackSubview, superView: stack)
        
        buttonDelete = ViewBuilder.configureButton(Locals.deleteText, action: #selector(deleteInfo))
        ViewBuilder.configureSubview(view: buttonDelete, height: Locals.heightOfStackSubview, superView: stack)

    }
    
    @objc private func buttonClicked() {
        if let login = nameField.text, let passw = passwField.text {
            if let registeredUser = UserDefaultDataManager.getUserDetails(), registeredUser.login == login, registeredUser.password == passw {
                UserDefaultDataManager.authenficate()
                AppDelegate.shared.rootViewController.loadView(HomeViewController())
            }
        }
    }
    
    @objc private func buttonRegisterClicked() {
        AppDelegate.shared.rootViewController.loadView(RegisterViewController())
    }
    
    //for case you forgot what you write on register screen (app supports only one registered user)
    @objc private func deleteInfo() {
        UserDefaultDataManager.clearUserData()
    }
    
}

extension LoginViewController {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
}
