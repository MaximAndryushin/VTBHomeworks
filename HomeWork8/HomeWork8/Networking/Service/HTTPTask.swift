//
//  HTTPTask.swift
//  HomeWork8
//
//  Created by Maxim Andryushin on 09.07.2020.
//  Copyright © 2020 Maxim Andryushin. All rights reserved.
//

public typealias HTTPHeaders = [String:String]

public enum HTTPTask {
    case request
    
    case requestWithParameters(BodyParams: Parameters?, urlParams: Parameters?)
    
    case requestWithParametersAndHeaders(BodyParams: Parameters?, urlParams: Parameters?, headers: HTTPHeaders?)
    
    
}
