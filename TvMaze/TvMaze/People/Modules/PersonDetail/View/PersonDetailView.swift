import UIKit

class PersonDetailView: UIViewController, PersonDetailViewProtocol {

	var presenter: PersonDetailPresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func show(person: PersonPresentable) {
        
    }
    
    func show(shows: [ShowPresentable]) {
        
    }
}
