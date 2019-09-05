import UIKit

class ShowLIstRouter: ShowLIstRouterProtocol {

    weak var viewController: UIViewController?
    
    func showDetail(show: ShowDetailPresentable) {
        guard let detailController = ShowDetailModule.build() as? ShowDetailView else { return }
        detailController.showDetail = show
        viewController?.navigationController?.pushViewController(detailController, animated: true)
    }

}
