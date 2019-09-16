import UIKit

class PersonDetailInteractor: PersonDetailInteractorProtocol {

    weak var presenter: PersonDetailPresenterProtocol?
    
    var repository: PersonDetailRepositoryProtocol = PersonDetailRepository()
    
    func getCastCredits(personId: Int) {
        repository.shows(personId: personId).done { shows in
            self.presenter?.didGetCastCredits(shows: shows.compactMap{ Show(from: $0) })
            }.catch { error in
                print(error.localizedDescription)
        }
    }
}
