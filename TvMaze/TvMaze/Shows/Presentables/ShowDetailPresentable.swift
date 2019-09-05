//
//  ShowDetailPresentable.swift
//  TvMaze
//
//  Created by Josefina Perez on 05/09/2019.
//  Copyright © 2019 Josefina Perez. All rights reserved.
//

import Foundation

struct ShowDetailPresentable {
    var name: String
    var genres: [String]
    var imageURL: URL?
    
    init(show: Show) {
        name = show.name
        genres = show.genres
        imageURL = URL(string: show.image.original)
    }
}
