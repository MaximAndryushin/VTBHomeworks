//
//  LoginViewController.swift
//  HomeWork10
//
//  Created by Maxim Andryushin on 12.07.2020.
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
        
        stack = StackBuilder.createStack(height: Locals.heightOfStack, view: view)
        
        nameField = TextFieldBuilder.createField(Locals.loginText, fontSize: Locals.fontSize, view: self)
        
        passwField = TextFieldBuilder.createField(Locals.loginText, fontSize: Locals.fontSize, view: self)
        
        button = ButtonBuilder.createButton(Locals.buttonTitle, action: #selector(self.buttonClicked))
        
        buttonRegister = ButtonBuilder.createButton(Locals.registerText, action: #selector(buttonRegisterClicked))
        
        buttonDelete = ButtonBuilder.createButton(Locals.deleteText, action: #selector(deleteInfo))
        
        StackBuilder.addSubview(view: nameField, height: Locals.heightOfStackSubview, stack: stack)
        StackBuilder.addSubview(view: passwField, height: Locals.heightOfStackSubview, stack: stack)
        StackBuilder.addSubview(view: button, height: Locals.heightOfStackSubview, stack: stack)
        StackBuilder.addSubview(view: buttonRegister, height: Locals.heightOfStackSubview, stack: stack)
        StackBuilder.addSubview(view: buttonDelete, height: Locals.heightOfStackSubview, stack: stack)

    }
    
    @objc private func buttonClicked() {
        if let login = nameField.text, let passw = passwField.text {
            if let registeredUser = DataManager.shared.getUser(), registeredUser.name == login, registeredUser.password == passw {
                DataManager.shared.authenficate()
                AppDelegate.shared.rootViewController.loadView(HomeViewController())
            }
        }
    }
    
    @objc private func buttonRegisterClicked() {
        AppDelegate.shared.rootViewController.loadView(RegisterViewController())
    }
    
    //for case you forgot what you write on register screen 
    @objc private func deleteInfo() {
        DataManager.shared.clearUserData()
    }
    
}

extension LoginViewController {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
}

