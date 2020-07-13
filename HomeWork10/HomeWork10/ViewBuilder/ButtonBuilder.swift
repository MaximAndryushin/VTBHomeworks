//
//  ViewBuilder.swift
//  HomeWork10
//
//  Created by Maxim Andryushin on 12.07.2020.
//  Copyright © 2020 Maxim Andryushin. All rights reserved.
//

import UIKit

struct ButtonBuilder {
    
    static func createButton(_ text: String, action: Selector) -> UIButton {
        let button = UIButton(frame: .zero)
        button.setTitle(text, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 15
        button.addTarget(self, action: action, for: .touchUpInside)
        return button
    }
}
