import UIKit

class PersonDetailView: UIViewController, PersonDetailViewProtocol {

    @IBOutlet weak var personImg: UIImageView!
    @IBOutlet weak var birthdayLbl: UILabel!
    @IBOutlet weak var showsTable: UITableView!
    
    var presenter: PersonDetailPresenterProtocol?
    
    var shows: [ShowPresentable] = []

	override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
        presenter?.viewDidLoad()
    }
    
    func setupTable() {
        showsTable.register(ShowCell.self)
        showsTable.estimatedRowHeight = 111
        showsTable.rowHeight = UITableView.automaticDimension
    }
    
    func show(person: PersonPresentable) {
        title = person.name
        birthdayLbl.text = person.birthday
        personImg.kf.setImage(
            with: person.imageUrl,
            placeholder: UIImage(named: "placeholder"),
            options: nil)
    }
    
    func show(shows: [ShowPresentable]) {
        self.shows = shows
        showsTable.reloadData()
    }
}

extension PersonDetailView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let showCell: ShowCell = showsTable.dequeueReusableCell(forIndexPath: indexPath)
        showCell.configure(show: shows[indexPath.row])
        return showCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelect(row: indexPath.row)
    }
}
