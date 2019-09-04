//
//  ViewController.swift
//  TvMaze
//
//  Created by Josefina Perez on 04/09/2019.
//  Copyright © 2019 Josefina Perez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        testGetAllShows()
    }
    
    private func testGetAllShows() {
        let showsRepository = ShowsRepository()
        showsRepository.getAll().done({ shows in
            print(shows.compactMap({ $0.name }))
        }).catch({ error in
            print(error)
        })
    }
}
