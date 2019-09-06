import UIKit

class ShowDetailPresenter: ShowDetailPresenterProtocol {

    weak var view: ShowDetailViewProtocol?
    var interactor: ShowDetailInteractorProtocol?
    var router: ShowDetailRouterProtocol?
    
    func viewDidLoad(showId: Int) {
        interactor?.getEpisodes(showId: showId)
    }
    
    func didGet(episodes: [Episode]) {
        view?.show(episodes: episodes.compactMap{ EpisodePresentable(episode: $0) })
    }

}
