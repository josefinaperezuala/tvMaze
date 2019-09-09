//
//  APIRouter.swift
//  TvMaze
//
//  Created by Josefina Perez on 06/09/2019.
//  Copyright © 2019 Josefina Perez. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    
    case shows
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
       return .get
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .shows:
            return "shows"
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        return nil
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.baseUrl.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
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
