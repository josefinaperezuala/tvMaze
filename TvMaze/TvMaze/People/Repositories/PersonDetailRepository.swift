//
//  PersonDetailRepository.swift
//  TvMaze
//
//  Created by Josefina Perez on 11/09/2019.
//  Copyright © 2019 Josefina Perez. All rights reserved.
//

import PromiseKit

protocol PersonDetailRepositoryProtocol {
    func shows(personId: Int) -> Promise<[CastCreditService]>
}


class PersonDetailRepository: PersonDetailRepositoryProtocol {
    
    var apiManager = APIManager()
    
    func shows(personId: Int) -> Promise<[CastCreditService]> {
        return Promise<[CastCreditService]> { seal in
            apiManager.request(CastCreditRouter.shows(personId: personId)).done { shows in
                seal.fulfill(shows)
                }.catch { error in
                    seal.reject(error)
            }
        }
    }
}
