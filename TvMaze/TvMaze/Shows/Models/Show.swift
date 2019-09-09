//
//  Show.swift
//  TvMaze
//
//  Created by Josefina Perez on 04/09/2019.
//  Copyright © 2019 Josefina Perez. All rights reserved.
//

import SwiftyJSON

struct Schedule {
    
    let time: String
    let days: [String]
}

struct Image {
    
    let medium: String
    let original: String
}

class Show {
    
    let id: Int
    let url: String
    let name: String
    let genres: [String]
    let schedule: Schedule
    let image: Image
    
    init(
        id: Int,
        url: String,
        name: String,
        genres: [String],
        schedule: Schedule,
        image: Image)
    {
        self.id = id
        self.url = url
        self.name = name
        self.genres = genres
        self.schedule = schedule
        self.image = image
    }
}

