import UIKit

class PersonDetailView: UIViewController, PersonDetailViewProtocol {

    @IBOutlet weak var personImg: UIImageView!
    @IBOutlet weak var birthdayLbl: UILabel!
    
    var presenter: PersonDetailPresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
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
        
    }
}
