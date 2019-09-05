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
    
    func getShow(id: Int) {
        repository.getShow(id: id).done { show in
            self.presenter?.showDetail(show: show)
        }
    }
}
