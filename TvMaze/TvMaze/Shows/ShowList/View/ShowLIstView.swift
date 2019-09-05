import UIKit

class ShowLIstView: UIViewController, ShowLIstViewProtocol {

    @IBOutlet weak var showsTable: UITableView!
    
    var presenter: ShowLIstPresenterProtocol?
    var shows = [ShowPresentable]()
    
    let showCellIdentifier = "ShowCell"
    
	override func viewDidLoad() {
        super.viewDidLoad()
        setUpTable()
        presenter?.viewDidLoad()
    }
    
    func setUpTable(){
        showsTable.register(UINib(nibName: showCellIdentifier, bundle: nil), forCellReuseIdentifier: showCellIdentifier)
    }
    
    func show(show: [ShowPresentable]) {
        self.shows = show
        showsTable.reloadData()
    }

}

extension ShowLIstView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let showCell = tableView.dequeueReusableCell(withIdentifier: showCellIdentifier) as? ShowCell else {
            return UITableViewCell()
        }
        
        showCell.configure(show: shows[indexPath.row])
        return showCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
}
