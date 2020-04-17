//
//  Endpoint.swift
//  NetworkingKit
//
//  Created by Stoyan Stoyanov on 29/05/2019.
//  Copyright © 2019 Stoyan Stoyanov. All rights reserved.
//

import Foundation


// MARK: - Group Definition

/// Group Containing All supported types of endpoints that `NetworkingKit` supports.
public struct Endpoint {
    
    @available(*, unavailable)
    private init() {}
    
    /// The `URLSession` object used for creating all endpoints.
    /// You can set yourself as a delegate to it, or change it to other session created by you.
    ///
    /// Default Value is: `URLSession.shared`
    public static var sharedSession: URLSession = .shared
}
