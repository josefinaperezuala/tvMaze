//
//  ShowMapper.swift
//  TvMaze
//
//  Created by Josefina Perez on 04/09/2019.
//  Copyright © 2019 Josefina Perez. All rights reserved.
//

import SwiftyJSON

class ShowMapper {
    
    static func map(from json: JSON) -> Show {
        
        return Show(id: json["id"].intValue,
             url: json["url"].stringValue,
             name: json["name"].stringValue,
             type: json["type"].stringValue,
             language: json["language"].stringValue,
             genres: json["genres"].arrayValue.compactMap({ $0.stringValue }),
             status: json["status"].stringValue,
             runtime: json["runtime"].intValue,
             premiered: json["premiered"].stringValue,
             officialSite: json["officialSite"].stringValue,
             schedule: ScheduleMapper.map(from: json["schedule"]),
             rating: RatingMapper.map(from: json["rating"]),
             weight: json["weight"].intValue,
             network: NetworkMapper.map(from: json["network"]),
             webChannel: json["webChannel"].string,
             externals: ExternalsMapper.map(from: json["externals"]),
             image: ImageMapper.map(from: json["image"]),
             summary: json["summary"].stringValue,
             updated: json["updated"].intValue,
             links: LinksMapper.map(from: json["_links"]))
    }
}
