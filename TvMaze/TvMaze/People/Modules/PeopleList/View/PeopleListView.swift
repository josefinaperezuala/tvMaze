import UIKit

class PeopleListView: UIViewController, PeopleListViewProtocol {

    @IBOutlet weak var searchBar: UISearchBar!
    
    var presenter: PeopleListPresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func show(people: [PersonPresentable]) {
        print(people)
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


