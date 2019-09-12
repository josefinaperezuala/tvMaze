import Foundation

protocol PersonDetailRouterProtocol: class {
    func showDetail(show: Show)
}

protocol PersonDetailPresenterProtocol: class {
    func viewDidLoad()
    func didGetCastCredits(shows: [Show])
    func didSelect(row: Int)
}


protocol PersonDetailInteractorProtocol: class {

  var presenter: PersonDetailPresenterProtocol?  { get set }
    
    func getCastCredits(personId: Int)
}


protocol PersonDetailViewProtocol: class {

  var presenter: PersonDetailPresenterProtocol?  { get set }
    
    func show(person: PersonPresentable)
    func show(shows: [ShowPresentable])
}
