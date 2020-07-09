//
//  ExampleEndPoint.swift
//  HomeWork8
//
//  Created by Maxim Andryushin on 09.07.2020.
//  Copyright © 2020 Maxim Andryushin. All rights reserved.
//
import Foundation


struct Example: EndPointType {
    
    var baseURL: URL {
        guard let url = URL(string: "https://upload.wikimedia.org/wikipedia/commons/1/1a/Arthur%2C_the_cat.jpg") else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        return ""
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
}
