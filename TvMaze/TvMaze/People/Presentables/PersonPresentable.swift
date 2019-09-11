//
//  PersonPresentable.swift
//  TvMaze
//
//  Created by Josefina Perez on 10/09/2019.
//  Copyright © 2019 Josefina Perez. All rights reserved.
//

import Foundation

struct PersonPresentable {
    
    var name: String
    var imageUrl: String?
    
    init(person: Person) {
        self.name = person.name
        self.imageUrl = person.image?.original
    }
}
