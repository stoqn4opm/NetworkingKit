//
//  HTTP+Header.swift
//  NetworkingKit
//
//  Created by Stoyan Stoyanov on 29/05/2019.
//  Copyright © 2019 Stoyan Stoyanov. All rights reserved.
//

import Foundation


// MARK: - HTTP Header

extension HTTP {
    
    /// Container that represents a single key:value HTTP Header field.
    public struct Header {
        
        /// The name of this HTTP header.
        let key: Key
        
        /// The value stored under this header key.
        let value: String?
        
        
        /// Creates a new `HTTP.Header` object with given values.
        ///
        /// - Parameters:
        ///   - key: The name of this HTTP header.
        ///   - value: The value stored under this header key.
        public init(_ key: Key, value: String?) {
            self.key = key
            self.value = value
        }
    }
}
