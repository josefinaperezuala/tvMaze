import UIKit

class PersonDetailPresenter: PersonDetailPresenterProtocol {

    weak var view: PersonDetailViewProtocol?
    var interactor: PersonDetailInteractorProtocol?
    var router: PersonDetailRouterProtocol?
    
    var person: Person?
    var shows: [Show] = []
    
    func viewDidLoad() {
        guard let person = person else {
            return
        }
        view?.show(person: PersonPresentable(person: person))
        interactor?.getCastCredits(personId: person.id)
    }
    
    func didGetCastCredits(shows: [Show]) {
        self.shows = shows
        view?.show(shows: shows.compactMap { ShowPresentable(show: $0) })
    }
    
    func didSelect(row: Int) {
        router?.showDetail(show: shows[row])
    }
}
