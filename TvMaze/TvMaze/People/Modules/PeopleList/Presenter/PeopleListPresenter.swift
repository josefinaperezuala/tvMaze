import UIKit

class PeopleListPresenter: PeopleListPresenterProtocol {

    weak var view: PeopleListViewProtocol?
    var interactor: PeopleListInteractorProtocol?
    var router: PeopleListRouterProtocol?
    
    private var people: [Person] = []
    
    func searchDidChange(search: String) {
        interactor?.searchPeople(search: search)
    }
    
    func didGetSearchResults(people: [Person]) {
        self.people = people
        view?.show(people: people.compactMap { PersonPresentable(person: $0) })
    }
    
    func didSelect(row: Int) {
        router?.showDetail(person: people[row])
    }

}
