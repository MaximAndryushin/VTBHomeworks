//
//  RegisterViewController.swift
//  HomeWork10
//
//  Created by Maxim Andryushin on 12.07.2020.
//  Copyright © 2020 Maxim Andryushin. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: ~Constants
    private enum Locals {
        static let heightOfStack: CGFloat = 300
        static let buttonTitle = "SIGN UP"
        static let loginText = "Enter your username"
        static let passwordText = "Enter your password"
        static let fontSize: CGFloat = 20
        static let heightOfStackSubview: CGFloat = 60
    }
    
    private var nameField: UITextField!
    private var passwField: UITextField!
    private var stack: UIStackView!
    private var button: UIButton!

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
        
        StackBuilder.addSubview(view: nameField, height: Locals.heightOfStackSubview, stack: stack)
        StackBuilder.addSubview(view: passwField, height: Locals.heightOfStackSubview, stack: stack)
        StackBuilder.addSubview(view: button, height: Locals.heightOfStackSubview, stack: stack)
        
    }
    
    @objc private func buttonClicked() {
        if let login = nameField.text, let passw = passwField.text {
            DataManager.shared.saveUser(login, password: passw)
            AppDelegate.shared.rootViewController.loadView(LoginViewController())
        }
    }

}

extension RegisterViewController {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
}

