//
//  SamplePost.swift
//  NetworkingTestExample
//
//  Created by Stoyan Stoyanov on 30/05/2019.
//  Copyright © 2019 Stoyan Stoyanov. All rights reserved.
//

import NetworkingKit

/// This container has all things reagaring the `SamplePost` call.
struct SamplePost {}

extension SamplePost {
    
    /// If you want to call the endpoint initialize this.
    final class Call: Endpoint.WithRequestAndResponseType<Request, Response> {
        
        override var host: String { return "postman-echo.com" }
        
        override var path: String { return "/transform/collection" }
        
        override var queryItems: [URLQueryItem] {
            return [URLQueryItem(name: "from", value: "2"),
                    URLQueryItem(name: "to", value: "1")] }
        
        override var headers: [HTTP.Header] {
            return [.init(.contentType, value: HTTP.Header.ContentType.json.rawValue)]
        }
    }
}
