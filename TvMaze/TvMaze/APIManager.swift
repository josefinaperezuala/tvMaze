//
//  APIManager.swift
//  TvMaze
//
//  Created by Josefina Perez on 04/09/2019.
//  Copyright © 2019 Josefina Perez. All rights reserved.
//

import Alamofire
import PromiseKit

class APIManager {

    func request<T: Decodable>(_ request: Alamofire.URLRequestConvertible) -> Promise<T> {
       
        return Promise<T> { seal in
            AF.request(request).responseDecodable(completionHandler: {(response: DataResponse<T, AFError>) in
                
                switch response.result {
                case .success(let value):
                    seal.fulfill(value)
                case .failure(let error):
                    seal.reject(error)
                }
                
            })
        }
    }
}
