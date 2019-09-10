import Foundation

protocol ShowLIstRouterProtocol: class {
    func showDetail(show: Show)
}

protocol ShowLIstPresenterProtocol: class {
    
    var searchIsActive: Bool { get set }
    func viewDidLoad()
    func didGet(shows: [Show])
    func didFail(error: Error)
    func didSelect(row: Int)
    func searchDidChange(search: String)
    func didFinishSearch()
    func didGetSearchResults(shows: [Show])
}


protocol ShowLIstInteractorProtocol: class {

    var presenter: ShowLIstPresenterProtocol?  { get set }
    
    func getShows()
    func searchShows(name: String)
}


protocol ShowLIstViewProtocol: class {

  var presenter: ShowLIstPresenterProtocol?  { get set }
    
    func show(show: [ShowPresentable])
    func show(errorMsg: String)
}
