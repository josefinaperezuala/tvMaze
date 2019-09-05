import UIKit
import PromiseKit

class ShowLIstInteractor: ShowLIstInteractorProtocol {
    
    weak var presenter: ShowLIstPresenterProtocol?
    
    var repository: ShowsRepositoryProtocol!
    
    func getShows() {
        repository.getShows().done { shows in
            self.presenter?.didGet(shows: shows)
            }.catch { error in
                
        }
    }
}
