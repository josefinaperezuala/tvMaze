import UIKit

class PersonDetailRouter: PersonDetailRouterProtocol {
    
    weak var viewController: UIViewController?
    
    func showDetail(show: Show) {
        let showDetailController = ShowDetailModule.build(show: show)
        viewController?.navigationController?.pushViewController(showDetailController, animated: true)
    }

}
