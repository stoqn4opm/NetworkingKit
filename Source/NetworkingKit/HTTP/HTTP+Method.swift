//
//  HTTP+Method.swift
//  NetworkingKit
//
//  Created by Stoyan Stoyanov on 29/05/2019.
//  Copyright © 2019 Stoyan Stoyanov. All rights reserved.
//

import Foundation


// MARK: - HTTP Method

extension HTTP {
    
    /// HTTP defines methods (sometimes referred to as verbs) to indicate the desired action to be performed on the identified resource.
    ///
    /// - GET: Requests using GET should only retrieve data and should have no other effect.
    /// - POST: The POST method requests that the server accept the entity enclosed in the request as a new subordinate of the web resource identified by the URI.
    /// - DELETE: The DELETE method deletes the specified resource.
    /// - PUT: The PUT method requests that the enclosed entity be stored under the supplied URI.
    /// - PATCH: The PATCH method applies partial modifications to a resource.
    public enum Method: String {
        case GET
        case POST
        case DELETE
        case PUT
        case PATCH
    }
}
