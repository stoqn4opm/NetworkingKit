//
//  SampleGet.swift
//  NetworkingTestExample
//
//  Created by Stoyan Stoyanov on 30/05/2019.
//  Copyright © 2019 Stoyan Stoyanov. All rights reserved.
//

import Foundation
import NetworkingKit

/// The HTTP GET request method is meant to retrieve data from a server. The data is identified by a unique URI (Uniform Resource Identifier).
///
/// A GET request can pass parameters to the server using "Query String Parameters". For example, in the following request,
/// ```
/// http://example.com/hi/there?hand=wave
/// ```
/// The parameter "hand" has the value "wave".
///
/// This endpoint echoes the HTTP headers, request parameters and the complete URI requested.
struct SampleGet { }

// MARK: - SampleGetResponse

extension SampleGet {

    /// If you want to call the endpoint initialize this.
    final class Call: Endpoint.WithResponseTypeOnly<Response> {
        
        override var host: String { "postman-echo.com" }
        
        override var path: String { "/get" }
        
        override var queryItems: [URLQueryItem] {
            
            return [URLQueryItem(name: "foo1", value: "bar1"),
                    URLQueryItem(name: "foo2", value: "bar2")] }
    }
}
