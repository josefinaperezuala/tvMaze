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
        
        view.loadViewIfNeeded()
    }

    func testShowsCount() {
        //arrange
        let expectation = XCTestExpectation(description: "Shows count is 1")
        
        //act

        //assert
        DispatchQueue.main.asyncAfter(deadline: TestConstants.delay) {
            expectation.fulfill()
            XCTAssertEqual(self.view.shows.count, 1)
        }
        
        wait(for: [expectation], timeout: TestConstants.timeout)
        
    }
    
    func testShowsSearchCount() {
        //arrange
        let expectation = XCTestExpectation(description: "Shows count is 1")
        
        //act
        view.searchBar(view.searchBar, textDidChange: "")
        
        //assert
        DispatchQueue.main.asyncAfter(deadline: TestConstants.delay, execute: {
            expectation.fulfill()
            XCTAssertEqual(self.view.shows.count, 1)
        })
        
        wait(for: [expectation], timeout: TestConstants.timeout)
    }
    
    func testTappingShowCell() {
        //arrange
        let expectation = XCTestExpectation(description: "Show detail is pushed")
        let navigationController = MockNavigationController(rootViewController: view)
        
        //act
        DispatchQueue.main.asyncAfter(deadline: TestConstants.delay, execute: {
            self.view.tableView(self.view.showsTable, didSelectRowAt: IndexPath(row: 0, section: 0))
            
            //assert
            expectation.fulfill()
            XCTAssertTrue(navigationController.pushedViewController is ShowDetailView)
        })
        
        wait(for: [expectation], timeout: TestConstants.timeout)
    }
    
    func testPagination() {
        //arrange
        let expectation = XCTestExpectation(description: "Shows count increments when reaching the end of the table")
        
        //act
        DispatchQueue.main.asyncAfter(deadline: TestConstants.delay, execute: {
           
            let showsInitialCount = self.view.shows.count
            self.view.tableView(self.view.showsTable, willDisplay: ShowCell(), forRowAt: IndexPath(row: showsInitialCount - 1, section: 0))
            
            DispatchQueue.main.asyncAfter(deadline: TestConstants.delay, execute:{
                //assert
                expectation.fulfill()
                XCTAssertLessThan(showsInitialCount, self.view.shows.count)
            })
        })
        
        wait(for: [expectation], timeout: TestConstants.timeout)
    }
    
    func testShowCellInfo() {
        //arrange
        let expectation = XCTestExpectation(description: "Name should be Arrow")
        
        //act
        
        //assert
        DispatchQueue.main.asyncAfter(deadline: TestConstants.delay, execute: {
            expectation.fulfill()
            guard let showCell = self.view.showsTable.cellForRow(at: IndexPath(row: 0, section: 0)) as? ShowCell else {
                return
            }
            
            XCTAssertEqual(showCell.nameLbl.text, "Arrow")
        })
        
        wait(for: [expectation], timeout: TestConstants.timeout)
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
        return Show(id: 1, url: "", name: "Arrow", genres: ["Action", "Crime", "Science-Fiction"], schedule: Schedule(time: "22:00", days: ["Monday", "Tuesday"]), image: Image(medium: "", original: ""))
    }
    
    func createShowSearchService() -> ShowSearchService {
        return ShowSearchService(show: createShow())
    }
}
