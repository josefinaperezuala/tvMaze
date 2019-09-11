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
    var imageUrl: URL?
    var birthday: String
    
    init(person: Person) {
        self.name = person.name
        self.birthday = "\(person.birthday ?? "")"
        if let urlString = person.image?.original {
            self.imageUrl = URL(string: urlString)
        }
        
    }
}
