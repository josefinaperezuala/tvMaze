import Foundation

protocol PeopleListRouterProtocol: class {

}

protocol PeopleListPresenterProtocol: class {

}


protocol PeopleListInteractorProtocol: class {

  var presenter: PeopleListPresenterProtocol?  { get set }
}


protocol PeopleListViewProtocol: class {

  var presenter: PeopleListPresenterProtocol?  { get set }
}
