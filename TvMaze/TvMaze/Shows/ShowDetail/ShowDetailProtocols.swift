import Foundation

protocol ShowDetailRouterProtocol: class {

}

protocol ShowDetailPresenterProtocol: class {
    func viewDidLoad(showId: Int)
    func didGet(episodes: [Episode])
}


protocol ShowDetailInteractorProtocol: class {

  var presenter: ShowDetailPresenterProtocol?  { get set }
    func getEpisodes(showId: Int)
}


protocol ShowDetailViewProtocol: class {

  var presenter: ShowDetailPresenterProtocol?  { get set }
    func show(episodes: [EpisodePresentable])
}
