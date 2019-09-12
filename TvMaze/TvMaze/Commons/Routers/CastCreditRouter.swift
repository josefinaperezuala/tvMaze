//
//  CastCreditRouter.swift
//  TvMaze
//
//  Created by Josefina Perez on 11/09/2019.
//  Copyright © 2019 Josefina Perez. All rights reserved.
//

import Alamofire

enum CastCreditRouter: APIConfiguration {
    
    case shows(personId: Int)
    
    // MARK: - HTTPMethod
    var method: HTTPMethod {
        return .get
    }
    
    // MARK: - Path
    var path: String {
        switch self {
        case .shows(let personId):
            return "people/\(personId)/castcredits?embed=show"
        }
    }
    
    // MARK: - Parameters
    var parameters: Parameters? {
        return nil
    }
}
