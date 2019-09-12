import UIKit

class PeopleListRouter: PeopleListRouterProtocol {
    
    weak var viewController: UIViewController?
    
    func showDetail(person: Person) {
        let detailController = PersonDetailModule.build(person: person)
        viewController?.navigationController?.pushViewController(detailController, animated: true)
    }

}
