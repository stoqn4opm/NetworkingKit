//
//  HTTP+Header+ContentType.swift
//  NetworkingKit
//
//  Created by Stoyan Stoyanov on 29/05/2019.
//  Copyright © 2019 Stoyan Stoyanov. All rights reserved.
//

import Foundation


// MARK: - Content Type Common Values

extension HTTP.Header {
    
    /// Collection of most common values send under the `Content-Type` http header key.
    public enum ContentType: String {
        
        /// Marks the content as unspecified.
        case all = "*/*"
        
        /// Marks the content as plain text.
        case plainText = "text/plain"
        
        /// Marks the content as png image.
        case png = "image/png"
        
        /// Marks the content as jpeg image.
        case jpeg = "image/jpeg"
        
        /// Marks the content as gif image.
        case gif = "image/gif"
        
        /// Marks the content as mutipart form data.
        case multipartForm = "multipart/form-data"
        
        /// Marks the content as text that is in valid json format.
        case json = "application/json"
        
        /// Marks the content as text that is in valid xml format.
        case xml = "application/xml"
    }
}
