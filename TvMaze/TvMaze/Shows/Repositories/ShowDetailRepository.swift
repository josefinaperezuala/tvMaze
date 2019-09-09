//
//  ShowDetailRepository.swift
//  TvMaze
//
//  Created by Josefina Perez on 06/09/2019.
//  Copyright © 2019 Josefina Perez. All rights reserved.
//

import PromiseKit
import Alamofire

protocol ShowDetailRepositoryProtocol {
    func getEpisodes(showId: Int) -> Promise<[Episode]>
}

class ShowDetailRepository: ShowDetailRepositoryProtocol {
    
    let apiManager = APIManager()
    
    func getEpisodes(showId: Int) -> Promise<[Episode]> {
        
        return Promise<[Episode]> { seal in
            apiManager.request(EpisodesRouter.episodes(showId: showId)).done { episodes in
                seal.fulfill(episodes)
                }.catch { error in
                    seal.reject(error)
            }
        }
    }
}
