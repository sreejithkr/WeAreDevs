//
//  MovieListViewControllerTests.swift
//  WeAreDevsTests
//
//  Created by sreejitkr on 20/11/19.
//  Copyright © 2019 SKR. All rights reserved.
//

import XCTest
@testable import WeAreDevs

class MovieListViewControllerTests: XCTestCase {
    
    var viewController: MovieListViewController!

    override func setUp() {
        viewController = setupViewController() as? MovieListViewController
        UIApplication.shared.delegate?.window??.rootViewController = viewController
        XCTAssertNotNil(viewController.view)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCellCountEquivalentToPresenterDataCount() {
        viewController.viewDidLoad()
        let cellCount = viewController.tableView(UITableView(), numberOfRowsInSection: 0)
        XCTAssertEqual(cellCount, viewController.presenter.data.count)
    }

    private func setupViewController() -> UIViewController? {
        let bundle = Bundle(for: MovieListViewController.self)
        let storyBoard = UIStoryboard(name: "Main", bundle: bundle)
        let viewControllerName =  ViewControllerNames.movieListViewController.value
        let viewController = storyBoard.instantiateViewController(identifier: viewControllerName)
        return viewController
    }

}


