//
//  TextFieldBuilder.swift
//  HomeWork10
//
//  Created by Maxim Andryushin on 13.07.2020.
//  Copyright © 2020 Maxim Andryushin. All rights reserved.
//

import UIKit

struct TextFieldBuilder {
    
    static func createField(_ placeholder: String, fontSize: CGFloat, view: UITextFieldDelegate) -> UITextField {
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
}
