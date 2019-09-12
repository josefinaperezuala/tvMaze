//
//  ShowDetailTest.swift
//  TvMazeTests
//
//  Created by Josefina Perez on 12/09/2019.
//  Copyright © 2019 Josefina Perez. All rights reserved.
//

import XCTest
import PromiseKit
@testable import TvMaze

class ShowDetailTest: XCTestCase {
    
    let view = ShowDetailView()
    let interactor = ShowDetailInteractor()
    let router = ShowDetailRouter()
    let presenter = ShowDetailPresenter()
    
    override func setUp() {
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        presenter.show = ShowMockRepository().createShow()
        
        view.presenter = presenter
        interactor.presenter = presenter
        interactor.repository = ShowDetailMockRepository()
        router.viewController = view
    }
    
    func testEpisodesCount() {
        //arrange
        let expectacion = XCTestExpectation(description: "Episodes count should be 1")
            
        //act
        view.loadViewIfNeeded()
        
        //assert
        DispatchQueue.main.asyncAfter(deadline: TestConstants.delay, execute: {
            expectacion.fulfill()
            XCTAssertTrue(self.view.episodes.count == 1)
        })
        
        wait(for: [expectacion], timeout: TestConstants.timeout)
    }
    
    func testTextFormat() {
        //arrange
        let expectation = XCTestExpectation(description: "Genres and schedule should be formatted properly")
        
        //act
        view.loadViewIfNeeded()
        
        //assert
        DispatchQueue.main.asyncAfter(deadline: TestConstants.delay, execute: {
            expectation.fulfill()
            XCTAssertTrue(self.view.genresLbl.text == "Action | Crime | Science-Fiction")
            XCTAssertTrue(self.view.scheduleLbl.text == "Monday, Tuesday at 22:00 hs.")
            XCTAssertTrue(self.view.title == "Arrow")
        })
        
        wait(for: [expectation], timeout: TestConstants.timeout)
    }
}

class ShowDetailMockRepository: ShowDetailRepositoryProtocol {
    
    func getEpisodes(showId: Int) -> Promise<[Episode]> {
        return Promise.value([createEpisode()])
    }
    
    func createEpisode() -> Episode {
        return Episode(id: 1, url: "", name: "", season: 1, number: 1, airdate: "", airtime: "", airstamp: "", runtime: 1, image: Image(medium: "", original: ""), summary: "")
    }
}
