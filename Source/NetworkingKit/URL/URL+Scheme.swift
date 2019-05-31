//
//  URL+Scheme.swift
//  NetworkingKit
//
//  Created by Stoyan Stoyanov on 29/05/2019.
//  Copyright © 2019 Stoyan Stoyanov. All rights reserved.
//

import Foundation

// MARK: - URL Scheme

extension URL {
    
    ///  The URI scheme identifies the protocol to be used to access the resource on the Internet. The most common are HTTP (without SSL) or HTTPS (with SSL).
    ///
    /// - http: Hypertext Transfer Protocol
    /// - https: HTTP over Transport Layer Security
    public enum Scheme: String {
        
        /// HTTP means HyperText Transfer Protocol.
        ///
        /// HTTP is the underlying protocol used by the World Wide Web and this protocol defines how
        /// messages are formatted and transmitted, and what actions Web servers and browsers should take in response to various commands.
        case http
        
        /// HTTPS means Hyper Text Transfer Protocol Secure. Basically, it is the secure version of HTTP.
        ///
        /// Communications between the browser and website are encrypted by Transport Layer Security (TLS), or its predecessor, Secure Sockets Layer (SSL).
        case https
    }
}
