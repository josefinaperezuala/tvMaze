import UIKit

class PeopleListModule {

    static func build() -> UIViewController {        
        let view = PeopleListView()
        let interactor = PeopleListInteractor()
        let router = PeopleListRouter()
        let presenter = PeopleListPresenter()

        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        view.presenter = presenter
        view.title = "People"
        interactor.presenter = presenter
        router.viewController = view
        
        return UINavigationController(rootViewController: view)
    }    
}
