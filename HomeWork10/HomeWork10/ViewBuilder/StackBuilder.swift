//
//  StackBuilder.swift
//  HomeWork10
//
//  Created by Maxim Andryushin on 13.07.2020.
//  Copyright © 2020 Maxim Andryushin. All rights reserved.
//

import UIKit

struct StackBuilder {
    
    static func createStack(height: CGFloat, view: UIView) -> UIStackView {
        let stack = UIStackView()
        stack.alignment = .center
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        view.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.heightAnchor.constraint(equalToConstant: height),
            stack.centerYAnchor.constraint(equalTo: view.compatibleSafeAreaLayoutGuide.centerYAnchor),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        return stack
    }
    
    static func addSubview(view: UIView, height: CGFloat, stack: UIStackView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(view)
        
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: height),
            view.widthAnchor.constraint(equalTo: stack.widthAnchor, constant: -20),
        ])
    }
}
