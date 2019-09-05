//
//  CountryMapper.swift
//  TvMaze
//
//  Created by Josefina Perez on 04/09/2019.
//  Copyright © 2019 Josefina Perez. All rights reserved.
//

import SwiftyJSON

class CountryMapper {
    
    static func map(from json: JSON) -> Country {
        
        return Country(name: json["name"].stringValue,
                       code: json["code"].stringValue,
                       timezone: json["timezone"].stringValue)
    }
}
