//
//  ShowPresentable.swift
//  TvMaze
//
//  Created by Josefina Perez on 05/09/2019.
//  Copyright © 2019 Josefina Perez. All rights reserved.
//

import Foundation

struct ShowPresentable {
    var name: String
    var imageUrl: URL?
    
    init(show: Show) {
        name = show.name
        imageUrl = URL(string: show.image.original)
    }
}
