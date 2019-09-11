import Foundation

protocol PersonDetailRouterProtocol: class {

}

protocol PersonDetailPresenterProtocol: class {
    func viewDidLoad()
    func didGetCastCredits(shows: [Show])
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
