import Foundation
import PromiseKit

protocol PeopleListRouterProtocol: class {

}

protocol PeopleListPresenterProtocol: class {
    func searchDidChange(search: String)
    func didGetSearchResults(people: [Person])
}


protocol PeopleListInteractorProtocol: class {

    var presenter: PeopleListPresenterProtocol?  { get set }
    func searchPeople(search: String)
}


protocol PeopleListViewProtocol: class {

    var presenter: PeopleListPresenterProtocol?  { get set }
    func show(people: [PersonPresentable])
}
