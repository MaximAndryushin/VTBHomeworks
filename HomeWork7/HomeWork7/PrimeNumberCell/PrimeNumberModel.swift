//
//  PrimeNumberModel.swift
//  HomeWork7
//
//  Created by Maxim Andryushin on 04.07.2020.
//  Copyright © 2020 Maxim Andryushin. All rights reserved.
//

import UIKit

class PrimeNumberModel {
    
    //MARK: ~ Constants
    private static let arrayWithEndings = ["th", "st", "nd", "rd"]
    private static let thEndingConstant = 20
    
    private let value: Int
    private let position: Int
    
    init(with val: Int, onPosition pos: Int) {
        value = val
        position = pos
    }
    
    func getValue() -> Int {
        return value
    }
    
    var nameValue: String {
        var returnedString = String(position)
        let lastDigit = Int(String(returnedString.last!))!
        
        //Check for defining ending
        if position >= PrimeNumberModel.arrayWithEndings.count && position < PrimeNumberModel.thEndingConstant || lastDigit >= PrimeNumberModel.arrayWithEndings.count {
            returnedString.append(PrimeNumberModel.arrayWithEndings[0])
        }
        else {
            returnedString.append(PrimeNumberModel.arrayWithEndings[lastDigit])
        }
        return returnedString + " prime number is " + String(value)
    }
}
