//
//  MovieListPresenterTests.swift
//  WeAreDevsTests
//
//  Created by sreejitkr on 19/11/19.
//  Copyright © 2019 SKR. All rights reserved.
//

import XCTest
@testable import WeAreDevs

class MovieListPresenterTests: XCTestCase {
    var presenter: MovieListPresenter?
    override func setUp() {
        ServiceManagerRegistry.setRegistry(registry: MockServiceManager.self)
        presenter = MovieListPresenter()
    }

    func testLoadDataCallCompelion() {
        let request = MovieListRequest(relativePath: "movies")
        let expecation = expectation(description: "testLoadDataCallCompelion")
        presenter?.loadData(request: request,
                            competion: { (data) in
                                expecation.fulfill()
        })
        wait(for: [expecation], timeout: 10.0)
    }

}
