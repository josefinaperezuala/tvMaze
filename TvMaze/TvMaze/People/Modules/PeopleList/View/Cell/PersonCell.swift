//
//  PersonCell.swift
//  TvMaze
//
//  Created by Josefina Perez on 11/09/2019.
//  Copyright © 2019 Josefina Perez. All rights reserved.
//

import UIKit
import Kingfisher

class PersonCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var personImg: UIImageView!
    
    func configure(person: PersonPresentable) {
        nameLbl.text = person.name
        personImg.kf.setImage(
            with: person.imageUrl,
            placeholder: UIImage(named: "placeholder"),
            options: nil)
    }
    
}
