//
//  GallerySearchEndpoint.swift
//  NetworkingTestExample
//
//  Created by Stoyan Stoyanov on 25/03/22.
//  Copyright © 2022 Stoyan Stoyanov. All rights reserved.
//

import Foundation
import NetworkingKit


/// Search the gallery with a given query string.
///
/// Due to caching limitations of Imgur, it's not possible to change the result size of the gallery resources.
///
/// This container has all things regarding the `GallerySearch` call.

/// If you want to call the endpoint initialize this.
final class GallerySearchEndpoint: Endpoint.WithResponseTypeOnly<Basic<[Image]>> {
    
    let sortedUsing: SortOption
    let inTimeWindow: Window
    let page: Int
    let appClientId: String
    let searchQuery: String
    
    override var host: String { "api.imgur.com" }
    
    override var path: String { "/3/gallery/search/\(sortedUsing.rawValue)/\(inTimeWindow.rawValue)/\(page)" }
    
    override var headers: [HTTP.Header] {
        [.init(.authorization, value: "Client-ID \(appClientId)")]
    }
    
    
    override var queryItems: [URLQueryItem] {
        [URLQueryItem(name: "q", value: searchQuery)]
    }
    
    @discardableResult public init(searchQuery: String, sortedUsing: SortOption = .top, inTimeWindow: Window = .all, page: Int, appClientId: String, completion: @escaping (Basic<[Image]>?, Endpoint.Error?) -> ()) {
        self.sortedUsing = sortedUsing
        self.inTimeWindow = inTimeWindow
        self.page = page
        self.appClientId = appClientId
        self.searchQuery = searchQuery
        super.init(completion: completion)
    }
    
    @available(*, unavailable)
    override init(completion: @escaping (Basic<[Image]>?, Endpoint.Error?) -> ()) {
        fatalError("not implemented")
    }
}
