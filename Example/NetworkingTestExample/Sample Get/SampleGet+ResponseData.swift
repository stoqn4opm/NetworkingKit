//
//  SampleGet+ResponseData.swift
//  NetworkingTestExample
//
//  Created by Stoyan Stoyanov on 30/05/2019.
//  Copyright © 2019 Stoyan Stoyanov. All rights reserved.
//

import Foundation

// MARK: - Sample Get Response Data

extension SampleGet {
    
    struct Response: Codable {
        let args: Argument
        let headers: Headers
        let url: String
        
        enum CodingKeys: String, CodingKey {
            case args = "args"
            case headers = "headers"
            case url = "url"
        }
    }
}

// MARK: - SampleGet Arguments Submodel

extension SampleGet.Response {
    
    struct Argument: Codable {
        let foo1: String
        let foo2: String
        
        enum CodingKeys: String, CodingKey {
            case foo1 = "foo1"
            case foo2 = "foo2"
        }
    }
}

// MARK: - SampleGet Headers Submodel

extension SampleGet.Response {
    
    struct Headers: Codable {
        let xForwardedProto: String
        let host: String
        let accept: String
        let acceptEncoding: String
        let acceptLanguage: String
        let userAgent: String
        let xForwardedPort: String
        
        enum CodingKeys: String, CodingKey {
            case xForwardedProto = "x-forwarded-proto"
            case host = "host"
            case accept = "accept"
            case acceptEncoding = "accept-encoding"
            case acceptLanguage = "accept-language"
            case userAgent = "user-agent"
            case xForwardedPort = "x-forwarded-port"
        }
    }
}
