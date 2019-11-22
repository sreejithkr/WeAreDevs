//
//  HomePresenterTests.swift
//  WeAreDevsTests
//
//  Created by Saravanakumar Selladurai on 21/11/19.
//  Copyright © 2019 SKR. All rights reserved.
//

import XCTest
@testable import WeAreDevs

class HomePresenterTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func testShouldVerifyIfTrueIsReturnedForValidEmailAddress() {
        let presenter = HomePresenter()
        let validEmail = "test_User07.07.2019@god.com"

        let result = presenter.isValid(validEmail)

        XCTAssertTrue(result)
    }

    func testShouldVerifyIfFalseIsReturnedForInvalidEmailAddress() {
        let presenter = HomePresenter()
        let inValidEmail = "test_User07.07.2019"

        let result = presenter.isValid(inValidEmail)

        XCTAssertFalse(result)
    }
    
//    func testShouldVerifyIfTrueIsReturnedForDomain_co_dot_in() {
//           let presenter = HomePresenter()
//           let validEmail = "test_User0@some.co.in"
//
//           let result = presenter.isValid(validEmail)
//
//           XCTAssertTrue(result)
//    }
}
