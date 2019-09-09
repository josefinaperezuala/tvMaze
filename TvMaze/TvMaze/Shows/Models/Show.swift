//
//  Show.swift
//  TvMaze
//
//  Created by Josefina Perez on 04/09/2019.
//  Copyright © 2019 Josefina Perez. All rights reserved.
//

struct Schedule: Decodable {
    
    let time: String
    let days: [String]
}

struct Image: Decodable {
    
    let medium: String
    let original: String
}

class Show: Decodable {
    
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

