//
//  PeopleRepository.swift
//  TvMaze
//
//  Created by Josefina Perez on 10/09/2019.
//  Copyright © 2019 Josefina Perez. All rights reserved.
//

import PromiseKit

protocol PeopleListRepositoryProtocol {
    func search(name: String) -> Promise<[PersonSearchService]>
}

class PeopleListRepository: PeopleListRepositoryProtocol {
    
    let apiManager = APIManager()
    
    func search(name: String) -> Promise<[PersonSearchService]> {
        return Promise<[PersonSearchService]> { seal in
            apiManager.request(PeopleRouter.search(name: name)).done { people in
                seal.fulfill(people)
                }.catch { error in
                    seal.reject(error)
            }
        }
    }
}
