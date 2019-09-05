import Foundation

protocol ShowLIstRouterProtocol: class {

}

protocol ShowLIstPresenterProtocol: class {
    
    func viewDidLoad()
    func didGet(shows: [Show])
    func didFail(error: Error)
}


protocol ShowLIstInteractorProtocol: class {

    var presenter: ShowLIstPresenterProtocol?  { get set }
    
    func getShows()
}


protocol ShowLIstViewProtocol: class {

  var presenter: ShowLIstPresenterProtocol?  { get set }
    
    func show(show: [ShowPresentable])
    func show(errorMsg: String)
}


struct ShowPresentable {
    var name: String
    var imageUrl: URL?
    
    init(show: Show) {
        name = show.name
        imageUrl = URL(string: show.image.original)
    }
}
