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
        let data: Request
        let url: String
        
        enum CodingKeys: String, CodingKey {
            case data
            case url
        }
    }
}
