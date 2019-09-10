//
//  ShowsRepository.swift
//  TvMaze
//
//  Created by Josefina Perez on 04/09/2019.
//  Copyright © 2019 Josefina Perez. All rights reserved.
//

import PromiseKit


protocol ShowsRepositoryProtocol {
    func getShows() -> Promise<[Show]>
    func getShows(page: String) -> Promise<[Show]>
    func search(name: String) -> Promise<[ShowSearchService]>
}

class ShowsRepository: ShowsRepositoryProtocol {

    let apiManager = APIManager()
    
    func getShows() -> Promise<[Show]> {
        
        return Promise<[Show]> { seal in
            apiManager.request(ShowsRouter.shows).done { shows in
                    seal.fulfill(shows)
                }.catch { error in
                    seal.reject(error)
            }
        }

    }
    
    func getShows(page: String) -> Promise<[Show]> {
        return Promise<[Show]> { seal in
            apiManager.request(ShowsRouter.showsPage(page: page)).done { shows in
                seal.fulfill(shows)
                }.catch { error in
                    seal.reject(error)
            }
        }
    }
    
    func search(name: String) -> Promise<[ShowSearchService]> {
        
        return Promise<[ShowSearchService]> { seal in
            apiManager.request(ShowsRouter.search(name: name)).done { shows in
                seal.fulfill(shows)
                }.catch {error in
                    seal.reject(error)
            }
        }
    }
}
