import Foundation

protocol PersonDetailRouterProtocol: class {

}

protocol PersonDetailPresenterProtocol: class {

}


protocol PersonDetailInteractorProtocol: class {

  var presenter: PersonDetailPresenterProtocol?  { get set }
}


protocol PersonDetailViewProtocol: class {

  var presenter: PersonDetailPresenterProtocol?  { get set }
}
