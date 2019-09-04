//
//  ScheduleMapper.swift
//  TvMaze
//
//  Created by Josefina Perez on 04/09/2019.
//  Copyright © 2019 Josefina Perez. All rights reserved.
//

import SwiftyJSON

class ScheduleMapper: NSObject {
    
    static func map(from json: JSON) -> Schedule {
        
        return Schedule(time: json["time"].stringValue,
                        days: json["days"].arrayValue.compactMap({ $0.stringValue }))
    }
}
