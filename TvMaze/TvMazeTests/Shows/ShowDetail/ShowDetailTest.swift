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
        
        view.loadViewIfNeeded()
    }
    
    func testEpisodesCount() {
        //arrange
        let expectacion = XCTestExpectation(description: "Episodes count is 1")
            
        //act
        
        //assert
        DispatchQueue.main.asyncAfter(deadline: TestConstants.delay, execute: {
            expectacion.fulfill()
            XCTAssertEqual(self.view.episodes.count, 1)
        })
        
        wait(for: [expectacion], timeout: TestConstants.timeout)
    }
    
    func testTextFormat() {
        //arrange
       
        //act
        
        //assert
        XCTAssertEqual(self.view.genresLbl.text, "Action | Crime | Science-Fiction")
        XCTAssertEqual(self.view.scheduleLbl.text, "Monday, Tuesday at 22:00 hs.")
        XCTAssertEqual(self.view.title, "Arrow")
    }
    
    func testEpisodeCellInfo() {
        //arrange
        let expectation = XCTestExpectation(description: "Text should be 1x1 - Pilot")
        
        //act
        
        //assert
        DispatchQueue.main.asyncAfter(deadline: TestConstants.delay, execute: {
            expectation.fulfill()
            guard let episodeCell = self.view.episodesTable.cellForRow(at: IndexPath(row: 0, section: 0)) as? EpisodeCell else {
                XCTFail()
                return
            }
            
            XCTAssertEqual(episodeCell.nameLbl.text, "1x1 - Pilot")
        })
        
        wait(for: [expectation], timeout: TestConstants.timeout)
    }
}

class ShowDetailMockRepository: ShowDetailRepositoryProtocol {
    
    func getEpisodes(showId: Int) -> Promise<[Episode]> {
        return Promise.value([createEpisode()])
    }
    
    func createEpisode() -> Episode {
        return Episode(id: 1, url: "", name: "Pilot", season: 1, number: 1, airdate: "", airtime: "", airstamp: "", runtime: 1, image: Image(medium: "", original: ""), summary: "")
    }
}
