//
//  APIManager.swift
//  TvMaze
//
//  Created by Josefina Perez on 04/09/2019.
//  Copyright © 2019 Josefina Perez. All rights reserved.
//

import Alamofire
import PromiseKit
import SwiftyJSON

class APIManager {
    
    private let baseUrl = "http://api.tvmaze.com/"
    
    func request(path: String, method: HTTPMethod, parameters: Parameters? = nil, encoding: ParameterEncoding = JSONEncoding.default, headers: HTTPHeaders? = nil) -> Promise<JSON> {
        
        return Promise<JSON> { seal in
            
            Alamofire.request(baseUrl + path, method: method,
                              parameters: parameters,
                              encoding: encoding,
                              headers: headers).responseJSON { (response) in
                                
                                switch response.result {
                                case .success:
                                    guard let value = response.result.value else { return }
                                    seal.fulfill(JSON(value))
                                case .failure(let error):
                                    seal.reject(error)
                                }
            }
        }
    }
}
