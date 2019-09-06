import PromiseKit

class ShowDetailInteractor: ShowDetailInteractorProtocol {

    weak var presenter: ShowDetailPresenterProtocol?
    
    var repository: ShowsRepository = ShowsRepository()
    
    func getEpisodes(showId: Int) {
        repository.getEpisodes(showId: showId).done { episodes in
            self.presenter?.didGet(episodes: episodes)
        }
    }
}
