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
    func getShows() -> Promise<[Show]>
    func getShows(page: String) -> Promise<[Show]>
    func search(name: String) -> Promise<[Show]>
}

class ShowsRepository: ShowsRepositoryProtocol {

    let apiManager = APIManager()
    
    func getShows() -> Promise<[Show]> {
        return getShowsPages()
    }
    
    func getShows(page: String) -> Promise<[Show]> {
        return getShowsPages(page: page)
    }
    
    func search(name: String) -> Promise<[Show]> {
        
        return Promise<[Show]> { seal in
            apiManager.request(APIRouter.search(name: name)).done { json in
                
                let shows = json.arrayValue.compactMap{ ShowMapper.map(from: $0["show"]) }
                seal.fulfill(shows)
                }.catch { error in
                    seal.reject(error)
            }
        }
    }
    
    private func getShowsPages(page: String? = nil) -> Promise<[Show]> {
        
        return Promise<[Show]> { seal in
            apiManager.request(
                page != nil ? APIRouter.showsPage(page: page ?? "0") : APIRouter.shows).done { json in
            
                    let shows = json.arrayValue.compactMap{ ShowMapper.map(from: $0) }
                    seal.fulfill(shows)
                }.catch { error in
                    seal.reject(error)
            }
        }
    }
}
