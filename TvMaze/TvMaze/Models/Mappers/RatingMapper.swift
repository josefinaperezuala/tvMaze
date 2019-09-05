//
//  RatingMapper.swift
//  TvMaze
//
//  Created by Josefina Perez on 04/09/2019.
//  Copyright © 2019 Josefina Perez. All rights reserved.
//

import SwiftyJSON

class RatingMapper {
    
    static func map(from json: JSON) -> Rating {
        
        return Rating(average: json["average"].floatValue)
    }

}
