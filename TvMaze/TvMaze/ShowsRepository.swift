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
    func getShow(id: Int) -> Promise<Show>
    func getEpisodes(showId: Int) -> Promise<[Episode]>
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
            apiManager.request(path: "search/shows?q=" + name, method: .get).done { json in
                
                let shows = json.arrayValue.compactMap{ ShowMapper.map(from: $0["show"]) }
                seal.fulfill(shows)
                }.catch { error in
                    seal.reject(error)
            }
        }
    }
    
    func getShow(id: Int) -> Promise<Show> {
        
        return Promise<Show> { seal in
            apiManager.request(path: "shows/\(id)" , method: .get).done { json in
                
                let show = ShowMapper.map(from: json)
                seal.fulfill(show)
                }.catch{ error in
                    seal.reject(error)
            }
        }
    }
    
    func getEpisodes(showId: Int) -> Promise<[Episode]> {
        
        return Promise<[Episode]> { seal in
            apiManager.request(path: "shows/\(showId)/episodes", method: .get).done { json in
                let episodes = json.arrayValue.compactMap{ EpisodeMapper.map(from: $0) }
                seal.fulfill(episodes)
                }.catch { error in
                    seal.reject(error)
            }
        }
    }
    
    private func getShowsPages(page: String? = nil) -> Promise<[Show]> {
        
        return Promise<[Show]> { seal in
            apiManager.request(path: "shows\(page == nil ? "" : "?page=\(page ?? "0")")",
                method: .get).done { json in
                    
                    let shows = json.arrayValue.compactMap{ ShowMapper.map(from: $0) }
                    seal.fulfill(shows)
                }.catch { error in
                    seal.reject(error)
            }
        }
    }
}
