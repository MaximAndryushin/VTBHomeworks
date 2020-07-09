//
//  EndPointType.swift
//  HomeWork8
//
//  Created by Maxim Andryushin on 09.07.2020.
//  Copyright © 2020 Maxim Andryushin. All rights reserved.
//
import UIKit


public typealias HTTPHeaders = [String:String]

protocol  EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
}

