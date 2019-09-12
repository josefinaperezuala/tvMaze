//
//  PeopleRouter.swift
//  TvMaze
//
//  Created by Josefina Perez on 10/09/2019.
//  Copyright © 2019 Josefina Perez. All rights reserved.
//

import Alamofire

enum PeopleRouter: APIConfiguration {
    
    case search(name: String)
    
    // MARK: - HTTPMethod
    var method: HTTPMethod {
        return .get
    }
    
    // MARK: - Path
    var path: String {
        switch self {
        case .search(let name):
            return "search/people?q=\(name)"
        }
    }
    
    // MARK: - Parameters
    var parameters: Parameters? {
        return nil
    }
}
