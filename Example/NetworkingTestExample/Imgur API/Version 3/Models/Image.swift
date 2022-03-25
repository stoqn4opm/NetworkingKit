//
//  GalleryImage.swift
//  NetworkingTestExample
//
//  Created by Stoyan Stoyanov on 25/03/22.
//  Copyright © 2022 Stoyan Stoyanov. All rights reserved.
//

import Foundation

// MARK: - Imgur GalleryImage Model

/// The data model formatted for gallery images from Imgur's API.
///
/// Image thumbnails
/// There are 6 total thumbnails that an image can be resized to.
/// Each one is accessible by appending a single character suffix
/// to the end of the image id, and before the file extension.
///
/// The thumbnails are:
///
/// - s: Small Square (90x90) - Keeps Proportions: No
/// - b: Big Square (160x160) - Keeps Proportions: No
/// - t: Small Thumbnail (160x160) - Keeps Proportions: Yes
/// - m: Medium Thumbnail (320x320) - Keeps Proportions: Yes
/// - l: Large Thumbnail (640x640) - Keeps Proportions: Yes
/// - h: Huge Thumbnail (1024x1024) - Keeps Proportions: Yes
///
/// For example, the image located at https://i.imgur.com/12345.jpg
/// has the Medium Thumbnail located at https://i.imgur.com/12345m.jpg
///
/// More info: https://api.imgur.com/models/gallery_image
struct Image: Codable {
    
    /// The ID for the image.
    let id: String
    
    /// The title of the image.
    let title: String
    
    /// Description of the image
    ///
    /// Not documented as optional, but saw it being `nil` a couple of times.
    let description: String?
    
    /// The width of the image in pixels
    ///
    /// Not documented as optional, but saw it being `nil` a couple of times.
    let width: Int?
    
    /// The height of the image in pixels
    ///
    /// Not documented as optional, but saw it being `nil` a couple of times.
    let height: Int?
    
    /// The size of the image in bytes
    ///
    /// Not documented as optional, but saw it being `nil` a couple of times.
    let size: Int?
    
    /// The number of image views
    let views: Int
    
    /// The direct link to the the image.
    ///
    /// Image thumbnails
    ///
    /// There are 6 total thumbnails that an image can be resized to.
    /// Each one is accessible by appending a single character suffix
    /// to the end of the image id, and before the file extension.
    ///
    /// The thumbnails are:
    ///
    /// - s: Small Square (90x90) - Keeps Proportions: No
    /// - b: Big Square (160x160) - Keeps Proportions: No
    /// - t: Small Thumbnail (160x160) - Keeps Proportions: Yes
    /// - m: Medium Thumbnail (320x320) - Keeps Proportions: Yes
    /// - l: Large Thumbnail (640x640) - Keeps Proportions: Yes
    /// - h: Huge Thumbnail (1024x1024) - Keeps Proportions: Yes
    ///
    /// For example, the image located at https://i.imgur.com/12345.jpg
    /// has the Medium Thumbnail located at https://i.imgur.com/12345m.jpg
    ///
    /// Note: if fetching an animated GIF that was over 20MB in original size, a .gif thumbnail will be returned
    let link: String
    
    /// Upvotes for the image
    let ups: Int
    
    /// Number of downvotes for the image
    let downs: Int
    
    /// Upvotes minus downvotes
    let points: Int
    
    /// Imgur popularity score
    let score: Int
    
    /// Number of comments on the gallery image.
    let commentCount: Int
    
    /// Undocumented, noticing that its never `null`, but keep an eye
    let tags: [Tag]

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case width
        case height
        case size
        case description
        case views
        case link
        case ups
        case downs
        case points
        case score
        case commentCount = "comment_count"
        case tags
    }
}
