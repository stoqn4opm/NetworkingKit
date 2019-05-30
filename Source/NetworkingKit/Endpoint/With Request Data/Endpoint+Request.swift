//
//  Endpoint+Request.swift
//  NetworkingKit
//
//  Created by Stoyan Stoyanov on 30/05/2019.
//  Copyright © 2019 Stoyan Stoyanov. All rights reserved.
//

import Foundation

// MARK: - Endpoint With Request & Response

extension Endpoint {
    
    open class WithRequestAndResponseType<RequestDataType: Encodable, ResponseDataType: Codable> {
        
        // MARK: Properties
        
        
        open var scheme: URL.Scheme { return .https }
        
        open var host: String { return "localhost" }
        
        open var port: UInt16 { return scheme == .https ? 443 : 80 }
        
        open var path: String { return "/" }
        
        open var queryItems: [URLQueryItem] { return [] }
        
        open var headers: [HTTP.Header] { return [] }
        
        open var method: HTTP.Method { return .POST }
        
        open var timeout: TimePeriod { return .seconds(10) }
        
        
        // MARK: Coding & Decoding
        
        
        open func decodeResponse(_ data: Data) throws -> ResponseDataType  { return try JSONDecoder().decode(ResponseDataType.self, from: data) }
        
        open func encodeRequest(_ request: RequestDataType) throws -> Data { return try JSONEncoder().encode(request) }
        
        
        
        @discardableResult public init(withRequestData requestBody: RequestDataType, completion: @escaping (ResponseDataType?, Error?) -> ()) {
            
            guard var request = generatedRequest else { completion(nil, .failedToGenerateRequest); return }
            
            do {
                let httpBody = try encodeRequest(requestBody)
                request.httpBody = httpBody
                
                URLSession.shared.dataTask(with: request) { (data, response, error) in
                    // strong reference to self on purpose
                    self.handleResponse(data: data, urlResponse: response, error: error, completion: completion)
                    }.resume()
                
            } catch {
                completion(nil, .inputEncodingErrorOccured(error))
            }
        }
    }
}

extension Endpoint.WithRequestAndResponseType {
    
    var generatedRequest: URLRequest? {
        
        var components = URLComponents()
        components.scheme = scheme.rawValue
        components.host = host
        components.path = path
        components.port = Int(port) //convert from UInt16 so we know we have a valid port number
        components.queryItems = queryItems.isEmpty ? nil : queryItems
        
        guard let url = components.url else { return nil }
        var request = URLRequest(url: url)
        request.timeoutInterval = timeout.interval
        request.httpMethod = method.rawValue
        
        // Add user set headers to requests
        headers.forEach { request.addValue($0.value ?? "", forHTTPHeaderField: $0.key.rawValue) }
        
        return request
    }
}

