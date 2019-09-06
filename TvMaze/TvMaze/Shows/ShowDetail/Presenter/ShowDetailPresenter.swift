import UIKit

class ShowDetailPresenter: ShowDetailPresenterProtocol {

    weak var view: ShowDetailViewProtocol?
    var interactor: ShowDetailInteractorProtocol?
    var router: ShowDetailRouterProtocol?
    var show: Show?
    
    func viewDidLoad() {
        guard let show = show else {
            return
        }
        
        view?.show(showDetail: ShowDetailPresentable(show: show))
        interactor?.getEpisodes(showId: show.id)
    }
    
    func didGet(episodes: [Episode]) {
        view?.show(episodes: episodes.compactMap{ EpisodePresentable(episode: $0) })
    }

}
