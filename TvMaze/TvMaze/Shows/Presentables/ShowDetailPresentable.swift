//
//  ShowDetailPresentable.swift
//  TvMaze
//
//  Created by Josefina Perez on 05/09/2019.
//  Copyright © 2019 Josefina Perez. All rights reserved.
//

import Foundation

struct ShowDetailPresentable {
    var id: Int
    var name: String
    var genres: String
    var imageURL: URL?
    var schedule: String
    
    init(show: Show) {
        id = show.id
        name = show.name
        imageURL = URL(string: show.image.original)
        genres = ""
        schedule = ""
        
        show.genres.enumerated().forEach{
            genres.append("\($0.0 != show.genres.count - 1 ? "\($0.1) | " : "\($0.1)")")
        }
        
        show.schedule.days.enumerated().forEach{
            schedule.append("\($0.0 != show.schedule.days.count - 1 ? "\($0.1), " : "\($0.1) at \(show.schedule.time) hs.")")
        }
        
    }
}
