import UIKit

class ShowDetailModule {

    static func build() -> UIViewController {        
        let view = ShowDetailView()
        let interactor = ShowDetailInteractor()
        let router = ShowDetailRouter()
        let presenter = ShowDetailPresenter()

        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }    
}
