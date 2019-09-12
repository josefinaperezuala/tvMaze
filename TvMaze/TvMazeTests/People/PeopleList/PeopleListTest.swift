//
//  PeopleListTest.swift
//  TvMazeTests
//
//  Created by Josefina Perez on 12/09/2019.
//  Copyright © 2019 Josefina Perez. All rights reserved.
//

import XCTest
import PromiseKit
@testable import TvMaze

class PeopleListTest: XCTestCase {
    
    let view = PeopleListView()
    let interactor = PeopleListInteractor()
    let presenter = PeopleListPresenter()
    let router = PeopleListRouter()

    override func setUp() {
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        view.presenter = presenter
        interactor.presenter = presenter
        interactor.repository = PeopleMockRepository()
        router.viewController = view
    }
    
    func testPeopleSearchCount() {
        //arrange
        let expectation = XCTestExpectation(description: "People count should be 1")
        
        //act
        view.loadViewIfNeeded()
        view.searchBar(view.searchBar, textDidChange: "")
        
        //assert
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
            expectation.fulfill()
            XCTAssertTrue(self.view.people.count == 1)
        })
        
        wait(for: [expectation], timeout: 5)
    }
}

class PeopleMockRepository: PeopleListRepositoryProtocol {
    
    func search(name: String) -> Promise<[PersonSearchService]> {
        return Promise.value([createPersonSearchService()])
    }
    
    func createPerson() -> Person {
        return Person(id: 1, url: "", name: "", birthday: "", image: Image(medium: "", original: ""))
    }
    
    func createPersonSearchService() -> PersonSearchService {
        return PersonSearchService(person: createPerson())
    }
}
