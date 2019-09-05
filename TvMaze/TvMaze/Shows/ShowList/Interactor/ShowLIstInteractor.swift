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

//***************

//class ShowMock: ShowsRepositoryProtocol {
//
//    func getShows() -> Promise<[Show]> {
//        return Promise.value([
//            Show(id: 3, url: "", name: "", type: "", language: "", genres: [""], status: "", runtime: 3, premiered: "", officialSite: "3", weight: 3, summary: "", updated: 3)
//
//            ])
//    }
//
//}
