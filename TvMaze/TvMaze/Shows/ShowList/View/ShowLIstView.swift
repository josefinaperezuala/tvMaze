import UIKit

class ShowLIstView: UIViewController, ShowLIstViewProtocol {

    @IBOutlet weak var showsTable: UITableView!
    
    var presenter: ShowLIstPresenterProtocol?
    var shows = [ShowPresentable]()
    
    let showCellIdentifier = "ShowCell"
    let estimatedRowHeight: CGFloat = 110
    
	override func viewDidLoad() {
        super.viewDidLoad()
        setUpTable()
        presenter?.viewDidLoad()
    }
    
    func setUpTable(){
        showsTable.register(ShowCell.self)
        showsTable.estimatedRowHeight = estimatedRowHeight
        showsTable.rowHeight = UITableView.automaticDimension
    }
    
    func show(show: [ShowPresentable]) {
        self.shows = show
        showsTable.reloadData()
    }
    
    func show(errorMsg: String) {
        print(errorMsg)
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
}
