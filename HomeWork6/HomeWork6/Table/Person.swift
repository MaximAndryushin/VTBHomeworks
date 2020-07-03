//
//  CellModel.swift
//  HomeWork6
//
//  Created by Maxim Andryushin on 03.07.2020.
//  Copyright © 2020 Maxim Andryushin. All rights reserved.
//

import UIKit

final class Person: Codable {
    
    // MARK: ~Properties
    
    private let firstName: String
    private let secondName: String
    
    
    // MARK: ~Initializers
    
    init(_ firstName: String, _ secondName: String) {
        self.firstName = firstName
        self.secondName = secondName
    }
    
    
    var nameValue: String {
        return firstName + " " + secondName
    }
}
