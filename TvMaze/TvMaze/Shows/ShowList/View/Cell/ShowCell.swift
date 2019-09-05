//
//  ShowCell.swift
//  TvMaze
//
//  Created by Josefina Perez on 05/09/2019.
//  Copyright © 2019 Josefina Perez. All rights reserved.
//

import UIKit
import Kingfisher

class ShowCell: UITableViewCell {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var showImg: UIImageView!
    
    func configure(show: ShowPresentable) {
        nameLbl.text = show.name
        showImg.kf.setImage(
            with: show.imageUrl,
            placeholder: UIImage(named: "placeholder"),
            options: nil)
    }
    
}
