//
//  URLResponse+ErrorMessage.swift
//  NetworkingKit
//
//  Created by Stoyan Stoyanov on 31/05/2019.
//  Copyright © 2019 Stoyan Stoyanov. All rights reserved.
//

import Foundation


// MARK: - Errors Messages

extension URLResponse {
    
    /// Error message that is used when wrong kind or `URLResponse` is returned by the server.
    var errorMessage: String { "[NetworkingKit] extected HTTPURLResponse, but received \(type(of: self))" }
}
