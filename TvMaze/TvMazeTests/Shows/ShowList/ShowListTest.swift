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
        interactor.repository = ShowMockRepository()
        router.viewController = view
    }

    func testShowsCount() {
        //arrange
        let expectation = XCTestExpectation(description: "Shows count is 1")
        
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
    
    func testTappingShowCell() {
        //arrange
        let expectation = XCTestExpectation(description: "Show detail should be pushed")
        let navigationController = MockNavigationController(rootViewController: view)
        
        //act
        view.loadViewIfNeeded()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
            self.view.tableView(self.view.showsTable, didSelectRowAt: IndexPath(row: 0, section: 0))
            
            //assert
            expectation.fulfill()
            XCTAssertTrue(navigationController.pushedViewController is ShowDetailView)
        })
        
        wait(for: [expectation], timeout: 5)
    }
    
    func testPagination() {
        //arrange
        let expectation = XCTestExpectation(description: "Shows count should increment when reaching the end of the table")
        
        //act
        view.loadViewIfNeeded()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
           
            let showsInitialCount = self.view.shows.count
            self.view.tableView(self.view.showsTable, willDisplay: ShowCell(), forRowAt: IndexPath(row: showsInitialCount - 1, section: 0))
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute:{
                //assert
                expectation.fulfill()
                XCTAssertTrue(showsInitialCount < self.view.shows.count)
            })
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
        return Show(id: 1, url: "", name: "", genres: ["Action", "Crime", "Science-Fiction"], schedule: Schedule(time: "22:00", days: ["Monday", "Tuesday"]), image: Image(medium: "", original: ""))
    }
    
    func createShowSearchService() -> ShowSearchService {
        return ShowSearchService(show: createShow())
    }
}

class MockNavigationController: UINavigationController {
    
    var pushedViewController: UIViewController?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        pushedViewController = viewController
        super.pushViewController(viewController, animated: animated)
    }
}
