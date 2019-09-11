//
//  People.swift
//  TvMaze
//
//  Created by Josefina Perez on 10/09/2019.
//  Copyright © 2019 Josefina Perez. All rights reserved.
//

import Foundation

struct PersonSearchService: Decodable {
    var person: Person
}

struct CastCreditService: Decodable {
    var showInfo: ShowSearchService
    
    private enum CodingKeys: String, CodingKey {
        case showInfo = "_embedded"
    }
}

class Person: Decodable {
    
    var id: Int
    var url: String
    var name: String
    var birthday: String?
    var deathday: String?
    var gender: String?
    var image: Image?
    
    init(from service: PersonSearchService) {
        self.id = service.person.id
        self.url = service.person.url
        self.name = service.person.name
        self.birthday = service.person.birthday
        self.deathday = service.person.deathday
        self.gender = service.person.gender
        self.image = service.person.image
    }
}


