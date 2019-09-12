import UIKit

class PeopleListInteractor: PeopleListInteractorProtocol {

    weak var presenter: PeopleListPresenterProtocol?
    
    var repository: PeopleListRepositoryProtocol = PeopleListRepository()
    
    func searchPeople(search: String) {
        repository.search(name: search).done { people in
            self.presenter?.didGetSearchResults(people: people.compactMap{ Person(from: $0) })
            }.catch { error in
                
        }
    }
}
