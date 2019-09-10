import UIKit

class ShowLIstView: UIViewController, ShowLIstViewProtocol {

    @IBOutlet weak var showsTable: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var presenter: ShowLIstPresenterProtocol?
    var shows = [ShowPresentable]()
    
    let showCellIdentifier = "ShowCell"
    let estimatedRowHeight: CGFloat = 110
    
	override func viewDidLoad() {
        super.viewDidLoad()
        setUpTable()
        searchBar.showsCancelButton = true
        presenter?.viewDidLoad()
    }
    
    private func setUpTable(){
        showsTable.register(ShowCell.self)
        showsTable.estimatedRowHeight = estimatedRowHeight
        showsTable.rowHeight = UITableView.automaticDimension
    }
    
    private func cleanSearchBar() {
        searchBar.resignFirstResponder()
        searchBar.text = ""
    }
    
    // MARK: - ShowLIstViewProtocol
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
        let showCell: ShowCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        showCell.configure(show: shows[indexPath.row])
        return showCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelect(row: indexPath.row)
    }
}

extension ShowLIstView: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        presenter?.didFinishSearch()
        cleanSearchBar()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBarsd: UISearchBar, textDidChange searchText: String) {
        presenter?.searchDidChange(search: searchText)
    }

}
