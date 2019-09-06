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
    
    init(show: Show) {
        id = show.id
        name = show.name
        imageURL = URL(string: show.image.original)
        genres = ""
        show.genres.enumerated().forEach{
            genres.append("\($0.0 != show.genres.count - 1 ? "\($0.1) | " : "\($0.1)")")
        }
    }
}
