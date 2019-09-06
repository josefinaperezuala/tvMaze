//
//  ImageMapper.swift
//  TvMaze
//
//  Created by Josefina Perez on 04/09/2019.
//  Copyright © 2019 Josefina Perez. All rights reserved.
//

import SwiftyJSON

class ImageMapper {
    
    static func map(from json: JSON) -> Image {
        
        return Image(medium: json["medium"].stringValue,
                     original: json["original"].stringValue)
    }
}
