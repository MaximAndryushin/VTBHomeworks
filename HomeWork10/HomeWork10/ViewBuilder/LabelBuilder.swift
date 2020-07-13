//
//  LabelBuilder.swift
//  HomeWork10
//
//  Created by Maxim Andryushin on 13.07.2020.
//  Copyright © 2020 Maxim Andryushin. All rights reserved.
//

import UIKit

struct LabelBuilder {
    
    static func createLabel(_ text: String, fontSize: CGFloat) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = .black
        label.textAlignment = .center
        label.font = .systemFont(ofSize: fontSize)
        return label
    }
}
