import UIKit

class PersonDetailPresenter: PersonDetailPresenterProtocol {

    weak var view: PersonDetailViewProtocol?
    var interactor: PersonDetailInteractorProtocol?
    var router: PersonDetailRouterProtocol?
    

}
