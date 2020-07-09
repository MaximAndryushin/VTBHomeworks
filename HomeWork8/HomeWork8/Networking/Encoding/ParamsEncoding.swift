//
//  ParameterEncoding.swift
//  HomeWork8
//
//  Created by Maxim Andryushin on 09.07.2020.
//  Copyright © 2020 Maxim Andryushin. All rights reserved.
//
import Foundation

public enum NetworkError: String, Error {
    case parametersNil = "Parameters are nil"
    case fail = "Encoding failed"
    case URLnil = "URL is nil"
}

public typealias Parameters = [String:Any]

public protocol ParametersEncoder {
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}
