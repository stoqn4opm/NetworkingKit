//
//  Endpoint+NoRequest.swift
//  NetworkingKit
//
//  Created by Stoyan Stoyanov on 30/05/2019.
//  Copyright © 2019 Stoyan Stoyanov. All rights reserved.
//

import Foundation


// MARK: - Endpoint With Response Body

extension Endpoint {
    
    /// Endpoint that does not set http request body.
    ///
    /// In order to user this kind of endpoint, you have to:
    ///
    /// - Subclass it and set specific `ResponseDataType`
    /// - Override whichever computed properties you like from the class to configure your network target
    /// - Call the initialiser of the Subclass and pass it completion block with `ResponseDataType` and `Endpont.Error`
    ///
    /// By default Codable JSONs are supported, but if you want you can provide your custom encoding
    /// by overriding the `decodeResponse()` function.
    open class WithResponseTypeOnly<ResponseDataType: Codable> {
        
        // MARK: Properties
        
        /// The scheme describes the protocol that will be used to reach the desired resource over the network.
        ///
        /// `NetworkingKit` supports `http` and `https`.
        ///
        /// Default value is `.https`.
        open var scheme: URL.Scheme { .https }
        
        /// The network host we are trying to reach.
        ///
        /// Default value is `"localhost"`
        open var host: String { "localhost" }
        
        /// The port over which we want to reach the desired network resource.
        ///
        /// Commonly used ports are:
        ///
        /// - 443 for https
        /// - 80 for http
        ///
        /// Default values are 443 and 80 based on the scheme.
        open var port: UInt16 { scheme == .https ? 443 : 80 }
        
        /// The path component of the url, describing exactly which endpoint we want to reach of this host.
        ///
        /// Default value is `"/"`.
        open var path: String { "/" }

        /// Collection of name-value pairs from the query portion of a URL.
        ///
        /// Default value is `[]` (empty).
        open var queryItems: [URLQueryItem] { [] }
        
        /// Collection of containers that represent key:value HTTP Header fields.
        ///
        /// Default value is `[]` (empty).
        open var headers: [HTTP.Header] { [] }
        
        /// The desired http method over which you want to talk with the desired network resource,
        /// as specified in the http communication protocol.
        ///
        /// Default value is `.GET`.
        open var method: HTTP.Method { .GET }
        
        /// The timeout duration of this communication.
        ///
        /// Default value is 10 seconds.
        open var timeout: TimePeriod { .seconds(10) }
        
        
        // MARK: Coding & Decoding
        
        /// The function whose purpose is to convert the server response data in to the `ResponseDataType` that you have passed.
        ///
        /// By default this function is capable of converting the data into Codable JSONs, but if you want custom conversion
        /// you can override this function and provide your own.
        ///
        /// - Parameter data: the raw data that has to be converted to `ResponseDataType`.
        /// - Returns: the already converted `ResponseDataType` object.
        /// - Throws: if error in the conversion occurs, if you are overriding this,
        /// throwing is the only way you can say that you fail the conversion.
        open func decodeResponse(_ data: Data) throws -> ResponseDataType  { try JSONDecoder().decode(ResponseDataType.self, from: data) }
        
        
        // MARK: Calling The Endpoint
        
        /// Invoke this initializer to call the Endpoint.
        ///
        /// - Parameters:
        ///   - completion: completion block, that gives you the server response in the form of `ResponseDataType`.
        ///   - response: the server response, parsed as `ResponseDataType`.
        ///   - error: error parameter, that is populated in case error has occured.
        @discardableResult public init(completion: @escaping (_ response: ResponseDataType?, _ error: Endpoint.Error?) -> ()) {
            
            guard let request = generatedRequest else { completion(nil, .failedToGenerateRequest); return }
            
            let task = Endpoint.sharedSession.dataTask(with: request) { data, response, error in
                // strong reference to self on purpose
                self.handleResponse(data: data, urlResponse: response, error: error, completion: completion)
            }
            task.resume()
        }
    }
}

// MARK: - Helpers

extension Endpoint.WithResponseTypeOnly {
    
    /// Handles the server response as received directly by the `URLDataTask`'s completion block.
    ///
    /// - Parameters:
    ///   - data: pass the data as received directly from the server.
    ///   - urlResponse: pass the url response as received directly from the server.
    ///   - error: pass the error parameter as received directly from the server.
    ///   - completion: the completion block that you want called with the parsed response.
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
