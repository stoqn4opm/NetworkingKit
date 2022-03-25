//
//  Tag.swift
//  NetworkingTestExample
//
//  Created by Stoyan Stoyanov on 25/03/22.
//  Copyright © 2022 Stoyan Stoyanov. All rights reserved.
//

import Foundation

// MARK: - Imgur Tag Model

/// The base model for a tag from Imgur's API.
///
/// More info: https://api.imgur.com/models/tag
struct Tag: Codable {
    
    /// Name of the tag.
    let name: String
    
    /// ??? Undocumented, maybe successor to `name`.
    let displayName: String
    
    /// Number of followers for the tag.
    let followers: Int
    
    /// Total number of gallery items for the tag.
    let totalItems: Int

    enum CodingKeys: String, CodingKey {
        case name
        case displayName = "display_name"
        case followers
        case totalItems = "total_items"
    }
}
