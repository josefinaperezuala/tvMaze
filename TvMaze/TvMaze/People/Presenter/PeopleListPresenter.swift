import UIKit

class PeopleListPresenter: PeopleListPresenterProtocol {

    weak var view: PeopleListViewProtocol?
    var interactor: PeopleListInteractorProtocol?
    var router: PeopleListRouterProtocol?
    

}
