import UIKit

class ShowDetailView: UIViewController, ShowDetailViewProtocol {

    @IBOutlet weak var showImg: UIImageView!
    @IBOutlet weak var genresLbl: UILabel!
    @IBOutlet weak var episodesTable: UITableView!
    
    var presenter: ShowDetailPresenterProtocol?
    
    var showDetail: ShowDetailPresentable!
    var episodes: [EpisodePresentable] = []
    
    let cellIdentifier = "EpisodeCell"

	override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter?.viewDidLoad(showId: showDetail.id)
    }
    
    func setup() {
        title = showDetail.name
        showImg.kf.setImage(
            with: showDetail.imageURL,
            placeholder: UIImage(named: "placeholder"),
            options: nil)
        genresLbl.text = showDetail.genres
        episodesTable.register(EpisodeCell.self)
    }
    
    func show(episodes: [EpisodePresentable]) {
        self.episodes = episodes
        episodesTable.reloadData()
    }
}

extension ShowDetailView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let episodeCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? EpisodeCell else {
            return UITableViewCell()
        }
        
        episodeCell.configure(episode: episodes[indexPath.row])
        return episodeCell
    }
    
    
}
