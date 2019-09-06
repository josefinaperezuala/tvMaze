//
//  WebChannelMapper.swift
//  TvMaze
//
//  Created by Josefina Perez on 04/09/2019.
//  Copyright © 2019 Josefina Perez. All rights reserved.
//

import SwiftyJSON

class WebChannelMapper {
    
    static func map(from json: JSON) -> WebChannel {
        
        return WebChannel(id: json["id"].intValue,
                          name: json["name"].stringValue,
                          country: CountryMapper.map(from: json["country"]))
    }
}
