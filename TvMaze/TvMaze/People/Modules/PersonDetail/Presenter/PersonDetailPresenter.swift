import UIKit

class PersonDetailPresenter: PersonDetailPresenterProtocol {

    weak var view: PersonDetailViewProtocol?
    var interactor: PersonDetailInteractorProtocol?
    var router: PersonDetailRouterProtocol?
    
    var person: Person?
    
    func viewDidLoad() {
        guard let person = person else {
            return
        }
        view?.show(person: PersonPresentable(person: person))
        interactor?.getCastCredits(personId: person.id)
    }
    
    func didGetCastCredits(shows: [Show]) {
        view?.show(shows: shows.compactMap { ShowPresentable(show: $0) })
    }
}
