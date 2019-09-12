//
//  PersonDetailTest.swift
//  TvMazeTests
//
//  Created by Josefina Perez on 12/09/2019.
//  Copyright © 2019 Josefina Perez. All rights reserved.
//

import XCTest
import PromiseKit
@testable import TvMaze

class PersonDetailTest: XCTestCase {
    
    let view = PersonDetailView()
    let interactor = PersonDetailInteractor()
    let presenter = PersonDetailPresenter()
    let router = PersonDetailRouter()
    
    override func setUp() {
       
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        presenter.person = PeopleListMockRepository().createPerson()
        
        view.presenter = presenter
        interactor.presenter = presenter
        interactor.repository = PersonDetailMockRepository()
        router.viewController = view
    }
    
    func testShowsCount() {
        //arrange
        let expectation = XCTestExpectation(description: "Shows count should be 1")
        
        //act
        view.loadViewIfNeeded()
        
        //assert
        DispatchQueue.main.asyncAfter(deadline: TestConstants.delay, execute: {
            expectation.fulfill()
            XCTAssertTrue(self.view.shows.count == 1)
        })
        
        wait(for: [expectation], timeout: TestConstants.timeout)
    }
    
    func testTappingShowCell() {
        //arrange
        let expectation = XCTestExpectation(description: "Show detail should be pushed")
        let navigationController = MockNavigationController(rootViewController: view)
        
        //act
        view.loadViewIfNeeded()
        
        DispatchQueue.main.asyncAfter(deadline: TestConstants.delay, execute: {
            expectation.fulfill()
            self.view.tableView(self.view.showsTable, didSelectRowAt: IndexPath(row: 0, section: 0))
            XCTAssertTrue(navigationController.pushedViewController is ShowDetailView)
        })
        
        wait(for: [expectation], timeout: TestConstants.timeout)
    }
}

class PersonDetailMockRepository: PersonDetailRepositoryProtocol {
    
    func shows(personId: Int) -> Promise<[CastCreditService]> {
        return Promise.value([createCastCreditService()])
    }
    
    func createCastCreditService() -> CastCreditService {
        return CastCreditService(showInfo: ShowSearchService(show:
            ShowMockRepository().createShow()))
    }
    
}
