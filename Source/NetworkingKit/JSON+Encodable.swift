//
//  JSON+Encodable.swift
//  NetworkingKit
//
//  Created by Stoyan Stoyanov on 30/05/2019.
//  Copyright © 2019 Stoyan Stoyanov. All rights reserved.
//

import Foundation

// MARK: - JSON Group Definition

/// Group containing methods for working with JSON objects.
struct JSON {
    @available(*, unavailable)
    private init() { }
}

// MARK: - JSON Encode & Decode

extension JSON {
    
    static func decodeResponse<ResponseData: Codable>(_ data: Data) throws -> ResponseData {
        
        let object = try JSONDecoder().decode(ResponseData.self, from: data)
        return object
    }
    
    static func encodeRequest<RequestData: Encodable>(_ request: RequestData) throws -> Data {
        
        let object = try JSONEncoder().encode(request)
        return object
    }
}

let a = try! JSON.encodeRequest("")
let b: String = try! JSON.decodeResponse(Data())
