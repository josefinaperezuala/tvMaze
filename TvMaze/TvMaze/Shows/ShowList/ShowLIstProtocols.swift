import Foundation

protocol ShowLIstRouterProtocol: class {
    func showDetail(show: Show)
}

protocol ShowLIstPresenterProtocol: class {
    
    func viewDidLoad()
    func didGet(shows: [Show])
    func didFail(error: Error)
    func didSelect(showId: Int)
    func showDetail(show: Show)
}


protocol ShowLIstInteractorProtocol: class {

    var presenter: ShowLIstPresenterProtocol?  { get set }
    
    func getShows()
    func getShow(id: Int)
}


protocol ShowLIstViewProtocol: class {

  var presenter: ShowLIstPresenterProtocol?  { get set }
    
    func show(show: [ShowPresentable])
    func show(errorMsg: String)
}
