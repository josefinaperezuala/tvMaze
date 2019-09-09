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

    func request(_ request: Alamofire.URLRequestConvertible) -> Promise<JSON> {
       
        return Promise<JSON> { seal in
            Alamofire.request(request).responseJSON(completionHandler: { (response) in
                
                switch response.result {
                case .success:
                    guard let value = response.result.value else { return }
                    seal.fulfill(JSON(value))
                case .failure(let error):
                    seal.reject(error)
                }
            })
        }
    }
}
