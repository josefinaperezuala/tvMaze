import UIKit

class ShowLIstPresenter: ShowLIstPresenterProtocol {
    
    weak var view: ShowLIstViewProtocol?
    var interactor: ShowLIstInteractorProtocol?
    var router: ShowLIstRouterProtocol?
    
    private var shows: [Show] = []
    private var showsFiltered: [Show] = []
    private var searchIsActive: Bool = false
    private var currentPage = 0
    private var waitingResults = false
    
    func loadShows() {
        if !waitingResults {
            interactor?.getShows(page: currentPage)
            waitingResults = true
        }
        currentPage += 1
    }
    
    func didGet(shows: [Show]) {
        self.shows = shows
        reloadViewWithShows()
    }
    
    func didFail(error: Error) {
        view?.show(errorMsg: error.localizedDescription)
    }
    
    func didSelect(row: Int) {
        let show = searchIsActive ? showsFiltered[row] : shows[row]
        router?.showDetail(show: show)
    }
    
    func searchDidChange(search: String) {
        searchIsActive = true
        interactor?.searchShows(name: search)
    }
    
    func didFinishSearch() {
        searchIsActive = false
        reloadViewWithShows()
    }
    
    func didGetSearchResults(shows: [Show]) {
        showsFiltered = shows
        view?.show(show: showsFiltered.map({ ShowPresentable(show: $0) }))
    }
    
    func didLoadShows(shows: [Show]) {
        waitingResults = false
        self.shows.append(contentsOf: shows)
        reloadViewWithShows()
    }
    
    private func reloadViewWithShows() {
        let presentables = shows.map({ ShowPresentable(show: $0) })
        view?.show(show: presentables)
    }
}
