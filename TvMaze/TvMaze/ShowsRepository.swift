//
//  ShowsRepository.swift
//  TvMaze
//
//  Created by Josefina Perez on 04/09/2019.
//  Copyright © 2019 Josefina Perez. All rights reserved.
//

import PromiseKit
import SwiftyJSON

protocol ShowsRepositoryProtocol {
    func getAll() -> Promise<[Show]>
}

class ShowsRepository: ShowsRepositoryProtocol {
    
    let apiManager = APIManager()
    
    func getAll() -> Promise<[Show]> {
        
        return Promise<[Show]> { seal in
            apiManager.request(path: "shows", method: .get).done { json in
                
                let shows = json.arrayValue.compactMap{ ShowMapper.map(from: $0) }
                seal.fulfill(shows)
                }.catch { error in
                    seal.reject(error)
            }
        }
    }
}
