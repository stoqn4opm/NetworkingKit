//
//  Endpoint+Error.swift
//  NetworkingKit
//
//  Created by Stoyan Stoyanov on 30/05/2019.
//  Copyright © 2019 Stoyan Stoyanov. All rights reserved.
//

import Foundation


// MARK: - Endpoint Errors

extension Endpoint {
    
    /// All possible errors that can occur in regards to Endpoints.
    public enum Error: Swift.Error {
        
        /// Occurs when you have entered wrong url request data like host or path in wrong format.
        case failedToGenerateRequest
        
        /// Occurs in endpoint that has request data, when the conversion to raw `Data` of this request container fails.
        ///
        /// By default, `Codable` JSONs are supported, but you can provide custom conversions
        /// by overriding the `encodeRequest()` function.
        case inputEncodingErrorOccurred(Swift.Error?)
        
        /// Occurs when the `Foundation` network classes give errors back.
        case urlSessionErrorOccurred(Swift.Error?)
        
        /// Occurs when we receive `URLResponse` that is different than `HTTPURLResponse`.
        case unexpectedURLResponse(String?)
        
        /// Occurs if the endpoint returns http status code that is not in 200..<400.
        case badStatusCode(Int)
        
        /// Occurs when the endpoint does not give any response to work with.
        case noDataReturned
        
        /// Occurs when the data returned from the server can not be decoded correctly into the set `ResponseType`.
        case responseDecodingErrorOccurred(Swift.Error?)
    }
}
