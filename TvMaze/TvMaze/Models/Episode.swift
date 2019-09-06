//
//  Episode.swift
//  TvMaze
//
//  Created by Josefina Perez on 06/09/2019.
//  Copyright © 2019 Josefina Perez. All rights reserved.
//

import Foundation

class Episode {
    var id: Int
    var url: String
    var name: String
    var season: Int
    var number: Int
    var airdate: String
    var airtime: String
    var airstamp: String
    var runtime: Int
    var image: Image
    var summary: String
    var links: Links
    
    init(id: Int,
         url: String,
         name: String,
         season: Int,
         number: Int,
         airdate: String,
         airtime: String,
         airstamp: String,
         runtime: Int,
         image: Image,
         summary: String,
         links: Links) {
        
        self.id = id
        self.url = url
        self.name = name
        self.season = season
        self.number = number
        self.airdate = airdate
        self.airtime = airtime
        self.airstamp = airstamp
        self.runtime = runtime
        self.image = image
        self.summary = summary
        self.links = links
    }
    
}
