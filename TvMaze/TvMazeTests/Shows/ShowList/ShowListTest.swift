//
//  ShowList.swift
//  TvMazeTests
//
//  Created by Josefina Perez on 05/09/2019.
//  Copyright © 2019 Josefina Perez. All rights reserved.
//

import XCTest
import PromiseKit
@testable import TvMaze

class ShowListTest: XCTestCase {

    let view = ShowLIstView()
    let interactor = ShowLIstInteractor()
    let router = ShowLIstRouter()
    let presenter = ShowLIstPresenter()

    override func setUp() {

        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor

        view.presenter = presenter
        view.title = "Shows"
        interactor.presenter = presenter
        router.viewController = view

        interactor.repository = ShowsRepository()
    }

    func testShowsCount() {
        //arrange
        let expectation = XCTestExpectation(description: "Shows count is 1")
        interactor.repository = ShowMockRepository()
        
        //act
        view.loadViewIfNeeded()

        //assert
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            expectation.fulfill()
            XCTAssert(self.view.shows.count == 1)
        }
        
        wait(for: [expectation], timeout: 5)
        
    }
    
    func testShowsSearchCount() {
        //arrange
        let expectation = XCTestExpectation(description: "Shows count is 1")
        interactor.repository = ShowMockRepository()
        
        //act
        view.loadViewIfNeeded()
        view.searchBar(view.searchBar, textDidChange: "")
        
        //assert
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
            expectation.fulfill()
            XCTAssert(self.view.shows.count == 1)
        })
        
        wait(for: [expectation], timeout: 5)
    }
}

class ShowMockRepository: ShowsRepositoryProtocol {
    
    func getShow(id: Int) -> Promise<Show> {
        return Promise.value(
            createShow()
            )
    }
    
    func getShows(page: String) -> Promise<[Show]> {
        return Promise.value([
            createShow()
            ])
    }
    
    func getShows() -> Promise<[Show]> {
        return Promise.value([
            createShow()
            ])
    }
    
    func search(name: String) -> Promise<[ShowSearchService]> {
        return Promise.value([createShowSearchService()])
    }
    
    func createShow() -> Show {
        return Show(id: 1, url: "", name: "", genres: [""], schedule: Schedule(time: "", days: [""]), image: Image(medium: "", original: ""))
    }
    
    func createShowSearchService() -> ShowSearchService {
        return ShowSearchService(show: createShow())
    }

}
