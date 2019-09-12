import Foundation

protocol ShowDetailRouterProtocol: class {

}

protocol ShowDetailPresenterProtocol: class {
    var show: Show? { get set }
    func viewDidLoad()
    func didGet(episodes: [Episode])
}


protocol ShowDetailInteractorProtocol: class {

  var presenter: ShowDetailPresenterProtocol?  { get set }
    func getEpisodes(showId: Int)
}


protocol ShowDetailViewProtocol: class {

  var presenter: ShowDetailPresenterProtocol?  { get set }
    func show(showDetail: ShowDetailPresentable)
    func show(episodes: [EpisodePresentable])
}
