//
//  EpisodeCell.swift
//  TvMaze
//
//  Created by Josefina Perez on 06/09/2019.
//  Copyright © 2019 Josefina Perez. All rights reserved.
//

import UIKit

class EpisodeCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    
    func configure(episode: EpisodePresentable) {
        nameLbl.text = episode.name
    }
    
}
