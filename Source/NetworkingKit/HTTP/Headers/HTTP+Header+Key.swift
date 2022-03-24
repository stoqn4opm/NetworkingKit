//
//  HTTP+Header+Key.swift
//  NetworkingKit
//
//  Created by Stoyan Stoyanov on 29/05/2019.
//  Copyright © 2019 Stoyan Stoyanov. All rights reserved.
//

import Foundation


// MARK: - HTTP Header Keys

extension HTTP.Header {
    
    /// Collection of commonly used http header keys.
    public enum Key {
        
        
        /// The HTTP Authorization request header contains the credentials to authenticate a user agent with a server,
        /// usually after the server has responded with a 401 Unauthorized status and the WWW-Authenticate header.
        ///
        /// Example:
        /// ```
        /// Authorization: Basic YWxhZGRpbjpvcGVuc2VzYW1l
        /// ```
        case authorization
        
        /// The Accept request HTTP header advertises which content types, expressed as MIME types,
        /// the client is able to understand. Using content negotiation, the server then selects one of the proposals,
        /// uses it and informs the client of its choice with the Content-Type response header. Browsers set adequate values
        /// for this header depending on the context where the request is done: when fetching a CSS stylesheet
        /// a different value is set for the request than when fetching an image, video or a script.
        ///
        /// Example:
        /// ```
        /// Accept: text/html
        /// Accept: image/*
        /// General default
        /// Accept: */*
        /// ```
        case accept
        
        /// The Accept-Encoding request HTTP header advertises which content encoding, usually a compression algorithm,
        /// the client is able to understand. Using content negotiation, the server selects one of the proposals,
        /// uses it and informs the client of its choice with the Content-Encoding response header.
        ///
        /// Example:
        /// ```
        /// Accept-Encoding: gzip
        /// Accept-Encoding: compress
        /// Accept-Encoding: deflate
        /// Accept-Encoding: br
        /// Accept-Encoding: identity
        /// Accept-Encoding: *
        /// ```
        case acceptEncoding
        
        /// The Content-Type entity header is used to indicate the media type of the resource.
        ///
        /// Example:
        /// ```
        /// Content-Type: text/html; charset=utf-8
        /// Content-Type: multipart/form-data; boundary=something
        /// ```
        case contentType
        
        /// The User-Agent request header contains a characteristic string that allows the network protocol peers to identify
        /// the application type, operating system, software vendor or software version of the requesting software user agent.
        case userAgent
        
        /// An API key or application programming interface key is a code that gets passed
        /// in by computer applications. The program or application then calls the API
        /// or application programming interface to identify its user, developer or calling program to a website.
        ///
        /// Application programming keys are normally used to assist in tracking and controlling
        /// how the interface is being utilized. Often, it does this to prevent abuse or malicious use of the API in question.
        ///
        /// An API key can act as a secret authentication token as well as a unique identifier.
        /// Typically, the key will come with a set of access rights for the API that it is associated with.
        case xApiKey
        
        /// Gives you the ability to set any other string you like as key.
        case custom(String)
        
        
        var rawValue: String {
            switch self {
            case .authorization: return "Authorization"
            case .accept: return "Accept"
            case .acceptEncoding: return "Accept-Encoding"
            case .contentType: return "Content-Type"
            case .userAgent: return "User-Agent"
            case .xApiKey: return "x-api-key"
            case let .custom(key): return key
            }
        }
    }
}
