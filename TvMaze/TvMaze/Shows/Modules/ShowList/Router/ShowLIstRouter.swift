import UIKit

class ShowLIstRouter: ShowLIstRouterProtocol {

    weak var viewController: UIViewController?
    
    func showDetail(show: Show) {
        let detailController = ShowDetailModule.build(show: show)
        viewController?.navigationController?.pushViewController(detailController, animated: true)
    }

}
