import UIKit

class PeopleListPresenter: PeopleListPresenterProtocol {

    weak var view: PeopleListViewProtocol?
    var interactor: PeopleListInteractorProtocol?
    var router: PeopleListRouterProtocol?
    
    func searchDidChange(search: String) {
        interactor?.searchPeople(search: search)
    }
    
    func didGetSearchResults(people: [Person]) {
        view?.show(people: people.compactMap { PersonPresentable(person: $0) })
    }

}
