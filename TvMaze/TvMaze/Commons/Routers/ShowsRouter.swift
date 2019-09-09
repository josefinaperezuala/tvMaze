//
//  APIRouter.swift
//  TvMaze
//
//  Created by Josefina Perez on 06/09/2019.
//  Copyright © 2019 Josefina Perez. All rights reserved.
//

import Foundation
import Alamofire

enum ShowsRouter: APIConfiguration {
    
    case shows
    case showsPage(page: String)
    case search(name: String)
    
    // MARK: - HTTPMethod
    var method: HTTPMethod {
       return .get
    }
    
    // MARK: - Path
    var path: String {
        switch self {
        case .shows:
            return "shows"
        case .showsPage(let page):
            return "shows\(page)"
        case .search(let name):
            return "search/shows?q=" + name
        }
    }
    
    // MARK: - Parameters
    var parameters: Parameters? {
        return nil
    }
}
