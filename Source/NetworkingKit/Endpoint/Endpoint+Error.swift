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
        
        case failedToGenerateRequest
        
        case inputEncodingErrorOccured(Swift.Error?)
        
        case urlSessionErrorOccured(Swift.Error?)
        
        case unexpectedURLResponse(String?)
        
        case badStatusCode(Int)
        
        case noDataReturned
        
        case responseDecodingErrorOccured(Swift.Error?)
    }
}
