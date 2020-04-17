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
    public enum Key: String {
        
        
        /// The HTTP Authorization request header contains the credentials to authenticate a user agent with a server,
        /// usually after the server has responded with a 401 Unauthorized status and the WWW-Authenticate header.
        ///
        /// Example:
        /// ```
        /// Authorization: Basic YWxhZGRpbjpvcGVuc2VzYW1l
        /// ```
        case authorization = "Authorization"
        
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
        case accept = "Accept"
        
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
        case acceptEncoding = "Accept-Encoding"
        
        /// The Content-Type entity header is used to indicate the media type of the resource.
        ///
        /// Example:
        /// ```
        /// Content-Type: text/html; charset=utf-8
        /// Content-Type: multipart/form-data; boundary=something
        /// ```
        case contentType = "Content-Type"
        
        /// The User-Agent request header contains a characteristic string that allows the network protocol peers to identify
        /// the application type, operating system, software vendor or software version of the requesting software user agent.
        case userAgent = "User-Agent"
    }
}
