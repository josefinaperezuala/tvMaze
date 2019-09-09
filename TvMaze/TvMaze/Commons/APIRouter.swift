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
    case showsPage(page: String)
    case search(name: String)
    case episodes(showId: Int)
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
       return .get
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .shows:
            return "shows"
        case .showsPage(let page):
            return "shows\(page)"
        case .search(let name):
            return "search/shows?q=" + name
        case .episodes(let showId):
            return "shows/\(showId)/episodes"
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
