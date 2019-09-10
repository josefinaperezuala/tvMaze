//
//  APIConfiguration.swift
//  TvMaze
//
//  Created by Josefina Perez on 09/09/2019.
//  Copyright © 2019 Josefina Perez. All rights reserved.
//

import Foundation
import Alamofire

protocol APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
    func asURLRequest() throws -> URLRequest
}

extension APIConfiguration {
    
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.baseUrl.asURL()
        
        let urlString = url.absoluteString + path
        var urlRequest = URLRequest(url: URL(string: urlString)!)
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
}
