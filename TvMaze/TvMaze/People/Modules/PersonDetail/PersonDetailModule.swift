import UIKit

class PersonDetailModule {

    static func build() -> UIViewController {        
        let view = PersonDetailView()
        let interactor = PersonDetailInteractor()
        let router = PersonDetailRouter()
        let presenter = PersonDetailPresenter()

        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }    
}
