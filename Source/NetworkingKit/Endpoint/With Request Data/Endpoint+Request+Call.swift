//
//  Endpoint+Request+Call.swift
//  NetworkingKit
//
//  Created by Stoyan Stoyanov on 30/05/2019.
//  Copyright © 2019 Stoyan Stoyanov. All rights reserved.
//

import Foundation


extension Endpoint.WithRequestAndResponseType {
    
    func handleResponse(data: Data?, urlResponse: URLResponse?, error: Swift.Error?, completion: @escaping (ResponseDataType?, Endpoint.Error?) -> ()) {
        
        guard error == nil else { completion(nil, .urlSessionErrorOccured(error)); return }
        guard let httpResponse = urlResponse as? HTTPURLResponse else { completion(nil, .unexpectedURLResponse(urlResponse?.errorMessage)); return }
        
        guard httpResponse.statusCode >= 200 && httpResponse.statusCode < 400 else { completion(nil, .badStatusCode(httpResponse.statusCode)); return }
        
        guard let data = data else { completion(nil, .noDataReturned); return }
        
        do {
            let parsedData = try decodeResponse(data)
            completion(parsedData, nil)
        } catch {
            completion(nil, .responseDecodingErrorOccured(error))
        }
    }
}


extension URLResponse {
    
    var errorMessage: String { return "[NetworkingKit] extected HTTPURLResponse, but received \(type(of: self))" }
}


