import UIKit

class ShowLIstModule {

    static func build() -> UIViewController {        
        let view = ShowLIstView()
        let interactor = ShowLIstInteractor()
        let router = ShowLIstRouter()
        let presenter = ShowLIstPresenter()

        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        view.presenter = presenter
        view.title = "Shows"
        interactor.presenter = presenter
        router.viewController = view
        
        interactor.repository = ShowsRepository() //or showMock
        
        return UINavigationController(rootViewController: view)
    }    
}
