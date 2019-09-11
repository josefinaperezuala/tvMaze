//
//  PersonCell.swift
//  TvMaze
//
//  Created by Josefina Perez on 11/09/2019.
//  Copyright © 2019 Josefina Perez. All rights reserved.
//

import UIKit

class PersonCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    
    func configure(person: PersonPresentable) {
        nameLbl.text = person.name
    }
    
}
