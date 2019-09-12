import PromiseKit

class ShowDetailInteractor: ShowDetailInteractorProtocol {

    weak var presenter: ShowDetailPresenterProtocol?
    
    var repository: ShowDetailRepositoryProtocol = ShowDetailRepository()
    
    func getEpisodes(showId: Int) {
        repository.getEpisodes(showId: showId).done { episodes in
            self.presenter?.didGet(episodes: episodes)
        }
    }
}
