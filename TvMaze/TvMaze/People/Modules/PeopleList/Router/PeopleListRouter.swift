import UIKit

class PeopleListRouter: PeopleListRouterProtocol {
    
    weak var viewController: UIViewController?
    
    func showDetail(person: Person) {
        guard let detailController = PersonDetailModule.build() as? PersonDetailView else {
            return
        }
        viewController?.navigationController?.pushViewController(detailController, animated: true)
    }

}
