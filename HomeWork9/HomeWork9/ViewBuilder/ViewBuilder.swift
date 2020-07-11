//
//  ViewBuilder.swift
//  HomeWork9
//
//  Created by Maxim Andryushin on 10.07.2020.
//  Copyright © 2020 Maxim Andryushin. All rights reserved.
//

import UIKit

struct ViewBuilder {
    
    static func configureField(_ placeholder: String, fontSize: CGFloat, view: UITextFieldDelegate) -> UITextField {
        let text = UITextField()
        text.placeholder = placeholder
        text.textColor = .black
        text.font = .systemFont(ofSize: fontSize)
        text.borderStyle = .roundedRect
        text.clearButtonMode = .always
        text.returnKeyType = .done
        text.delegate = view
        return text
    }
    
    static func configureLabel(_ text: String, fontSize: CGFloat) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = .black
        label.textAlignment = .center
        label.font = .systemFont(ofSize: fontSize)
        return label
    }
    
    static func configureButton(_ text: String, action: Selector) -> UIButton {
        let button = UIButton(frame: .zero)
        button.setTitle(text, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 15
        button.addTarget(self, action: action, for: .touchUpInside)
        return button
    }
    
    static func configureSubview(view: UIView, height: CGFloat, superView: UIStackView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        superView.addArrangedSubview(view)
        
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: height),
            view.widthAnchor.constraint(equalTo: superView.widthAnchor, constant: -20),
        ])
    }
}
