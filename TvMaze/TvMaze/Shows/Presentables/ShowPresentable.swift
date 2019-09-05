//
//  ShowPresentable.swift
//  TvMaze
//
//  Created by Josefina Perez on 05/09/2019.
//  Copyright © 2019 Josefina Perez. All rights reserved.
//

import Foundation

struct ShowPresentable {
    var id: Int
    var name: String
    var imageUrl: URL?
    
    init(show: Show) {
        id = show.id
        name = show.name
        imageUrl = URL(string: show.image.original)
    }
}
