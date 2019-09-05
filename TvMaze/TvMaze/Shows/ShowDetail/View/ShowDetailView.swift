import UIKit

class ShowDetailView: UIViewController, ShowDetailViewProtocol {

	var presenter: ShowDetailPresenterProtocol?
    
    var showDetail: ShowDetailPresentable!

	override func viewDidLoad() {
        super.viewDidLoad()
    }

}
