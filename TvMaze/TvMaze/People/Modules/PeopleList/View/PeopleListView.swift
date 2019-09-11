import UIKit

class PeopleListView: UIViewController, PeopleListViewProtocol {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var peopleTable: UITableView!
    
    var presenter: PeopleListPresenterProtocol?
    var people: [PersonPresentable] = []
    
    let estimatedRowHeight: CGFloat = 44
    
	override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
    }
    
    func setupTable() {
        peopleTable.register(PersonCell.self)
        peopleTable.estimatedRowHeight = estimatedRowHeight
        peopleTable.rowHeight = UITableView.automaticDimension
    }
    
    func show(people: [PersonPresentable]) {
        self.people = people
        peopleTable.reloadData()
    }
}

extension PeopleListView: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        presenter?.didFinishSearch()
//        cleanSearchBar()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBarsd: UISearchBar, textDidChange searchText: String) {
        presenter?.searchDidChange(search: searchText)
    }
    
}

extension PeopleListView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let personCell: PersonCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        personCell.configure(person: people[indexPath.row])
        return personCell
    }
    
}


