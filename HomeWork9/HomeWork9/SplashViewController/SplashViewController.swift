//
//  SplashViewController.swift
//  HomeWork9
//
//  Created by Maxim Andryushin on 11.07.2020.
//  Copyright © 2020 Maxim Andryushin. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    
    private enum Locals {
        static let indicatorColor = UIColor(white: 0, alpha: 0.4)
    }
    
    private let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(activityIndicator)
        activityIndicator.frame = view.bounds
        activityIndicator.backgroundColor = Locals.indicatorColor
        makeServiceCall()
    }
    
    private func makeServiceCall() {
        activityIndicator.startAnimating()
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            
            if UserDefaultDataManager.isAuthenficated() {
                // navigate to protected page
                AppDelegate.shared.rootViewController.loadView(HomeViewController())
            } else {
                // navigate to login screen
                AppDelegate.shared.rootViewController.loadView(LoginViewController())
            }
        }
    }
}
