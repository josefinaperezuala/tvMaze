import UIKit

class ShowLIstPresenter: ShowLIstPresenterProtocol {
    
    weak var view: ShowLIstViewProtocol?
    var interactor: ShowLIstInteractorProtocol?
    var router: ShowLIstRouterProtocol?
    
    func viewDidLoad() {
        interactor?.getShows()
    }
    
    func didGet(shows: [Show]) {
        let presentables = shows.map({ ShowPresentable(show: $0) })
        view?.show(show: presentables)
    }
    
    func didFail(error: Error) {
        view?.show(errorMsg: error.localizedDescription)
    }
}
