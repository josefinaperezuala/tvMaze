import Foundation

protocol ShowDetailRouterProtocol: class {

}

protocol ShowDetailPresenterProtocol: class {

}


protocol ShowDetailInteractorProtocol: class {

  var presenter: ShowDetailPresenterProtocol?  { get set }
  
}


protocol ShowDetailViewProtocol: class {

  var presenter: ShowDetailPresenterProtocol?  { get set }
}
