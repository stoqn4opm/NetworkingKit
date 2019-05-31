//
//  SamplePost+RequestData.swift
//  NetworkingTestExample
//
//  Created by Stoyan Stoyanov on 30/05/2019.
//  Copyright © 2019 Stoyan Stoyanov. All rights reserved.
//

import Foundation

// MARK: - Sample post Request Data

extension SamplePost {

    struct Request: Codable {
        let info: Info
        let item: [Item]
        
        enum CodingKeys: String, CodingKey {
            case info = "info"
            case item = "item"
        }
    }
    
    // MARK: - Info
    struct Info: Codable {
        let name: String
        let schema: String
        let infoDescription: String
        
        enum CodingKeys: String, CodingKey {
            case name = "name"
            case schema = "schema"
            case infoDescription = "description"
        }
    }
    
    // MARK: - Item
    struct Item: Codable {
        let name: String
        let request: RequestClass
        
        enum CodingKeys: String, CodingKey {
            case name = "name"
            case request = "request"
        }
    }
    
    // MARK: - RequestClass
    struct RequestClass: Codable {
        let url: String
        let method: String
        let header: [Header]?
        let body: Body?
        
        enum CodingKeys: String, CodingKey {
            case url = "url"
            case method = "method"
            case header = "header"
            case body = "body"
        }
    }
    
    // MARK: - Body
    struct Body: Codable {
        let mode: String
        let raw: String
        
        enum CodingKeys: String, CodingKey {
            case mode = "mode"
            case raw = "raw"
        }
    }
    
    // MARK: - Header
    struct Header: Codable {
        let key: String
        let value: String
        
        enum CodingKeys: String, CodingKey {
            case key = "key"
            case value = "value"
        }
    }
}
