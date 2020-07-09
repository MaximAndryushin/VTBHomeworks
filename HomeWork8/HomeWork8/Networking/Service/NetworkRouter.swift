//
//  NetworkRouter.swift
//  HomeWork8
//
//  Created by Maxim Andryushin on 09.07.2020.
//  Copyright © 2020 Maxim Andryushin. All rights reserved.
//

import Foundation

public typealias NetworkRouterCompletion = (_ data: Data?,_ response: URLResponse?,_ error: Error?)->()

protocol NetworkRouter: class {
    associatedtype EndPoint: EndPointType
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion)
    func cancel()
}

private enum Locals {
   static let timeoutInterval = 5.0
}

class Router<EndPoint: EndPointType>: NetworkRouter {

    private var task: URLSessionTask?
    
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion) {
        let session = URLSession.shared
        
        do {
            let request = try buildRequest(from: route)
            task = session.dataTask(with: request, completionHandler: { data, response, error in
              completion(data, response, error)
            })
        } catch {
            completion(nil, nil, error)
        }
        
        task?.resume()
    }
    
    fileprivate func buildRequest(from route: EndPoint) throws -> URLRequest {
        var request = URLRequest(url: route.baseURL)
        request.timeoutInterval = Locals.timeoutInterval
        request.httpMethod = route.httpMethod.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }
    
    func cancel() {
        task?.cancel()
    }
}
