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
        interactor.repository = ShowMock()

        //act
        view.loadViewIfNeeded()

        //assert
        XCTAssert(view.shows.count == 1)
    }
}

class ShowMock: ShowsRepositoryProtocol {
    func getShows(page: String) -> Promise<[Show]> {
        return Promise.value([
            createShow()
            ])
    }
    
    func search(name: String) -> Promise<[Show]> {
        return Promise.value([
            createShow()
            ])
    }
    

    func getShows() -> Promise<[Show]> {
        return Promise.value([
            createShow()
            ])
    }
    
    func createShow() -> Show {
        return Show(id: 1, url: "", name: "", type: "", language: "", genres: [""], status: "", runtime: 9, premiered: "", officialSite: "", schedule: Schedule(time: "", days: [""]), rating: Rating(average: 10), weight: 4, network: Network(id: 1, name: "", country: Country(name: "", code: "", timezone: "")), webChannel: WebChannel(id: 2, name: "", country: Country(name: "", code: "", timezone: "")), externals: Externals(tvrage: 3, thetvdb: 4, imdb: ""), image: Image(medium: "", original: ""), summary: "", updated: 2, links: Links(show: "", previousEpisode: ""))

    }

}
