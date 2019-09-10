//
//  EpisodesRouter.swift
//  TvMaze
//
//  Created by Josefina Perez on 09/09/2019.
//  Copyright © 2019 Josefina Perez. All rights reserved.
//

import Foundation
import Alamofire

enum EpisodesRouter: APIConfiguration {
    
    case episodes(showId : Int)
    
    // MARK: - HTTPMethod
    var method: HTTPMethod {
        return .get
    }
    
    // MARK: - Path
    var path: String {
        switch self {
        case .episodes(let showId):
            return "shows/\(showId)/episodes"
        }
    }
    
    // MARK: - Parameters
    var parameters: Parameters? {
        return nil
    }
}

