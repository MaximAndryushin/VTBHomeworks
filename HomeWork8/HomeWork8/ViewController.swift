//
//  ViewController.swift
//  HomeWork8
//
//  Created by Maxim Andryushin on 08.07.2020.
//  Copyright © 2020 Maxim Andryushin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var networkManager: NetworkManager! = NetworkManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //EXAMPLE of usage of network service
        
        view.backgroundColor = .red
        let subView = UIImageView()
        
        view.addSubview(subView)
        
        subView.translatesAutoresizingMaskIntoConstraints = false;
        NSLayoutConstraint.activate([
            subView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            subView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            subView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            subView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        
        networkManager.getImage { image, error in
            if let error = error {
                print(error)
            }
            if let image = image {
                DispatchQueue.main.async {
                    subView.image = image
                }
            }
        }

    }
}

