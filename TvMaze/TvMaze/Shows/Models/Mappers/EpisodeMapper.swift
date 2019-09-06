//
//  EpisodeMapper.swift
//  TvMaze
//
//  Created by Josefina Perez on 06/09/2019.
//  Copyright © 2019 Josefina Perez. All rights reserved.
//

import SwiftyJSON

class EpisodeMapper: NSObject {
    
    static func map(from json: JSON) -> Episode {
        return Episode(id: json["id"].intValue,
                       url: json["url"].stringValue,
                       name: json["name"].stringValue,
                       season: json["season"].intValue,
                       number: json["number"].intValue,
                       airdate: json["airdate"].stringValue,
                       airtime: json["airtime"].stringValue,
                       airstamp: json["airstamp"].stringValue,
                       runtime: json["runtime"].intValue,
                       image: ImageMapper.map(from: json["image"]),
                       summary: json["summary"].stringValue,
                       links: LinksMapper.map(from: json["_links"]))
    }

}
