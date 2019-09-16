//
//  MockNavigationController.swift
//  TvMazeTests
//
//  Created by Josefina Perez on 12/09/2019.
//  Copyright © 2019 Josefina Perez. All rights reserved.
//

import UIKit

class MockNavigationController: UINavigationController {
    
    var pushedViewController: UIViewController?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        pushedViewController = viewController
        super.pushViewController(viewController, animated: animated)
    }
}
