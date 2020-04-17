//
//  Endpoint+GenerateURLRequest.swift
//  NetworkingKit
//
//  Created by Stoyan Stoyanov on 31/05/2019.
//  Copyright © 2019 Stoyan Stoyanov. All rights reserved.
//

import Foundation


// MARK: - Endpoint With Request & Response

extension Endpoint.WithRequestAndResponseType {

    /// Generates url request by combining all configurable properties.
    var generatedRequest: URLRequest? {
        
        var components = URLComponents()
        components.scheme = scheme.rawValue
        components.host = host
        components.path = path
        components.port = Int(port) //convert from UInt16 so we know we have a valid port number
        components.queryItems = queryItems.isEmpty ? nil : queryItems
        
        guard let url = components.url else { return nil }
        var request = URLRequest(url: url)
        request.timeoutInterval = timeout.interval
        request.httpMethod = method.rawValue
        
        // Add user set headers to requests
        headers.forEach { request.addValue($0.value ?? "", forHTTPHeaderField: $0.key.rawValue) }
        
        return request
    }
}

// MARK: - Endpoint With Response Only

extension Endpoint.WithResponseTypeOnly {
    
    /// Generates url request by combining all configurable properties.
    var generatedRequest: URLRequest? {
        
        var components = URLComponents()
        components.scheme = scheme.rawValue
        components.host = host
        components.path = path
        components.port = Int(port) //convert from UInt16 so we know we have a valid port number
        components.queryItems = queryItems.isEmpty ? nil : queryItems
        
        guard let url = components.url else { return nil }
        var request = URLRequest(url: url)
        request.timeoutInterval = timeout.interval
        request.httpMethod = method.rawValue
        
        // Add user set headers to requests
        headers.forEach { request.addValue($0.value ?? "", forHTTPHeaderField: $0.key.rawValue) }
        
        return request
    }
}
