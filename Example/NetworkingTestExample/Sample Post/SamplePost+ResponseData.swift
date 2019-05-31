//
//  SamplePost+ResponseData.swift
//  NetworkingTestExample
//
//  Created by Stoyan Stoyanov on 30/05/2019.
//  Copyright © 2019 Stoyan Stoyanov. All rights reserved.
//

import Foundation

// MARK: - Sample Post Call Response Data

extension SamplePost {
    
    struct Response: Codable {
        let id: String
        let name: String
        let responseDescription: String
        let order: [String]
        let requests: [Request]
        
        enum CodingKeys: String, CodingKey {
            case id = "id"
            case name = "name"
            case responseDescription = "description"
            case order = "order"
            case requests = "requests"
        }
    }
}

// MARK: - Submodel for Requests

extension SamplePost.Response {
    
    struct Request: Codable {
        let id: String
        let name: String
        let collectionID: String
        let method: String
        let headers: String
        let rawModeData: String
        let tests: String?
        let preRequestScript: String?
        let url: String
        let dataMode: String?
        
        enum CodingKeys: String, CodingKey {
            case id = "id"
            case name = "name"
            case collectionID = "collectionId"
            case method = "method"
            case headers = "headers"
            case rawModeData = "rawModeData"
            case tests = "tests"
            case preRequestScript = "preRequestScript"
            case url = "url"
            case dataMode = "dataMode"
        }
    }
}
