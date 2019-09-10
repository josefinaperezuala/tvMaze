import UIKit
import PromiseKit

class ShowLIstInteractor: ShowLIstInteractorProtocol {
    
    
    weak var presenter: ShowLIstPresenterProtocol?
    
    var repository: ShowsRepositoryProtocol = ShowsRepository()
    
    func getShows() {
        repository.getShows().done { shows in
            self.presenter?.didGet(shows: shows)
            }.catch { error in
                
        }
    }
    
    func searchShows(name: String) {
        repository.search(name: name).done { shows in
            self.presenter?.didGetSearchResults(shows: shows.compactMap{ Show(from: $0)})
            }.catch { error in

        }
    }
}
