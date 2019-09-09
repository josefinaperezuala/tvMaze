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
             genres: json["genres"].arrayValue.compactMap({ $0.stringValue }),
             schedule: ScheduleMapper.map(from: json["schedule"]),
             image: ImageMapper.map(from: json["image"]))
    }
}
