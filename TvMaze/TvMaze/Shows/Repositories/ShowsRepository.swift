//
//  ShowsRepository.swift
//  TvMaze
//
//  Created by Josefina Perez on 04/09/2019.
//  Copyright © 2019 Josefina Perez. All rights reserved.
//

import PromiseKit
import Alamofire

protocol ShowsRepositoryProtocol {
    func getShows() -> Promise<[Show]>
    func getShows(page: String) -> Promise<[Show]>
    func search(name: String) -> Promise<[ShowSearchService]>
}

class ShowsRepository: ShowsRepositoryProtocol {

    let apiManager = APIManager()
    
    func getShows() -> Promise<[Show]> {
        return getShowsPages()
    }
    
    func getShows(page: String) -> Promise<[Show]> {
        return getShowsPages(page: page)
    }
    
    func search(name: String) -> Promise<[ShowSearchService]> {
        
        return Promise<[ShowSearchService]> { seal in
            apiManager.request(ShowsRouter.search(name: name)).done { shows in
                seal.fulfill(shows)
                }.catch { error in
                    seal.reject(error)
            }
        }
    }
    
    private func getShowsPages(page: String? = nil) -> Promise<[Show]> {
        
        return Promise<[Show]> { seal in
            apiManager.request(
                page != nil ? ShowsRouter.showsPage(page: page ?? "0") : ShowsRouter.shows).done { shows in
                    seal.fulfill(shows)
                }.catch { error in
                    seal.reject(error)
            }
        }
    }
}
