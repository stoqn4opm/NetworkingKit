//
//  Gallery.swift
//  NetworkingTestExample
//
//  Created by Stoyan Stoyanov on 25/03/22.
//  Copyright © 2022 Stoyan Stoyanov. All rights reserved.
//

import Foundation
import NetworkingKit


/// Fetch images from Imgur gallery.
///
/// Due to caching limitations of Imgur, it's not possible to change the result size of the gallery resources.
///
/// This container has all things regarding the `Gallery` call.

/// If you want to call the endpoint initialize this.
final class GalleryEndpoint: Endpoint.WithResponseTypeOnly<Basic<[Image]>> {
    
    let section: Section
    let sortedUsing: SortOption
    let inTimeWindow: Window
    let page: Int
    let appClientId: String
    
    override var host: String { "api.imgur.com" }
    
    override var path: String { "/3/gallery/\(section.rawValue)/\(sortedUsing.rawValue)/\(inTimeWindow.rawValue)/\(page)" }
    
    override var headers: [HTTP.Header] {
        [.init(.authorization, value: "Client-ID \(appClientId)")]
    }
    
    @discardableResult public init(section: Section = .hot, sortedUsing: SortOption = .top, inTimeWindow: Window = .all, page: Int, appClientId: String, completion: @escaping (Basic<[Image]>?, Endpoint.Error?) -> ()) {
        self.sortedUsing = sortedUsing
        self.inTimeWindow = inTimeWindow
        self.page = page
        self.appClientId = appClientId
        self.section = section
        super.init(completion: completion)
    }
    
    @available(*, unavailable)
    override init(completion: @escaping (Basic<[Image]>?, Endpoint.Error?) -> ()) {
        fatalError("not implemented")
    }
}
