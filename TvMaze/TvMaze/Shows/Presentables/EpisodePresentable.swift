//
//  EpisodePresentable.swift
//  TvMaze
//
//  Created by Josefina Perez on 06/09/2019.
//  Copyright © 2019 Josefina Perez. All rights reserved.
//

import Foundation

struct EpisodePresentable {
    var name: String
    
    init(episode: Episode) {
        name = "\(episode.season)x\(episode.number) - \(episode.name)"
    }
}
