import UIKit

class ShowDetailModule {

    static func build(show: Show) -> UIViewController {
        let view = ShowDetailView()
        let interactor = ShowDetailInteractor()
        let router = ShowDetailRouter()
        let presenter = ShowDetailPresenter()

        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        presenter.show = show
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }    
}
