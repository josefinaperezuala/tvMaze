//
//  ExternalsMapper.swift
//  TvMaze
//
//  Created by Josefina Perez on 04/09/2019.
//  Copyright © 2019 Josefina Perez. All rights reserved.
//

import SwiftyJSON

class ExternalsMapper {
    
    static func map(from json: JSON) -> Externals {
        
        return Externals(tvrage: json["tvrage"].intValue,
                         thetvdb: json["thetvdb"].intValue,
                         imdb: json["imdb"].stringValue)
    }

}
