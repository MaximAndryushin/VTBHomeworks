//
//  RegisterViewController.swift
//  HomeWork9
//
//  Created by Maxim Andryushin on 10.07.2020.
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
        
        
        
    }
    
    @objc private func buttonClicked() {
        if let login = nameField.text, let passw = passwField.text {
            UserDefaultDataManager.save(login, password: passw)
            AppDelegate.shared.rootViewController.loadView(LoginViewController())
        }
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

extension RegisterViewController {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
}

