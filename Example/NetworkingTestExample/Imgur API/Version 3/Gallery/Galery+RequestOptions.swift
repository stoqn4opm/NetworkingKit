//
//  Galery+RequestOptions.swift
//  NetworkingTestExample
//
//  Created by Stoyan Stoyanov on 25/03/22.
//  Copyright © 2022 Stoyan Stoyanov. All rights reserved.
//

import Foundation


// MARK: - Gallery Requests Options

/// Holds all possible sort strategies that can
/// be requested from the server for the search call.
///
/// Default is `.hot`
enum Section: String {
    
    /// The default option
    case hot
    case top
    case user
}

/// Holds all possible sort strategies that can
/// be requested from the server for the search call.
///
/// Default is `.top`
enum SortOption: String {
    
    /// Newest first
    case time
    
    /// Most viewed first (default)
    case viral
    
    /// Top rated first
    case top
    
    // Only available with user section. Can't be used in search
    case rising
}

/// Change the date range of the request **if the sort is** `.day`.
///
/// defaults to `.day`
enum Window: String {
    /// Default option
    case day
    case week
    case month
    case year
    case all
}
