import UIKit

class ShowLIstRouter: ShowLIstRouterProtocol {

    weak var viewController: UIViewController?
    
    func showDetail(show: Show) {
        guard let detailController = ShowDetailModule.build(show: show) as? ShowDetailView else { return }
        viewController?.navigationController?.pushViewController(detailController, animated: true)
    }

}
