//
//  LinksMapper.swift
//  TvMaze
//
//  Created by Josefina Perez on 04/09/2019.
//  Copyright © 2019 Josefina Perez. All rights reserved.
//

import SwiftyJSON

class LinksMapper {
    
    static func map(from json: JSON) -> Links {
        
        return Links(show: json["self"]["href"].stringValue,
                     previousEpisode: json["previousepisode"]["href"].stringValue)
    }
}
