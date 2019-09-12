import UIKit

class PersonDetailInteractor: PersonDetailInteractorProtocol {

    weak var presenter: PersonDetailPresenterProtocol?
    
    private var repository: PersonDetailRepository = PersonDetailRepository()
    
    func getCastCredits(personId: Int) {
        repository.shows(personId: personId).done { shows in
            self.presenter?.didGetCastCredits(shows: shows.compactMap{ Show(from: $0) })
            }.catch { error in
                print(error.localizedDescription)
        }
    }
}
