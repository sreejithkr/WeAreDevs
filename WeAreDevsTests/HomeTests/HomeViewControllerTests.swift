//
//  HomeViewControllerTests.swift
//  WeAreDevsTests
//
//  Created by Saravanakumar Selladurai on 21/11/19.
//  Copyright © 2019 SKR. All rights reserved.
//

import XCTest
@testable import WeAreDevs

class HomeViewControllerTests: XCTestCase {
    var homeViewController: HomeViewController!
    var homepresenter = MockHomePresenter()

    override func setUp() {
        homeViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "homeViewController") as? HomeViewController
        _ = homeViewController.view
        homeViewController.presenter = homepresenter
    }

    func testShouldVerifyIfTextFieldIsEmpty() {
        homeViewController.emailTextField.text = ""

        homeViewController.subscribeTapped(UIButton())

        XCTAssertEqual(homeViewController.errorLabel.text, "Enter a valid email address.")
    }

    func testShouldVerifyIfTextFieldHasAnInvalidEmail() {
        homeViewController.emailTextField.text = "george89@email.co.in.com"
        homepresenter.setValidEmail = false

        homeViewController.subscribeTapped(UIButton())

        XCTAssertEqual(homeViewController.errorLabel.text, "Entered email is invalid.")
    }

    func testShouldVerifyIfTextFieldHasValidEmailWithCom() {
        homeViewController.emailTextField.text = "george89@email.com"
        homepresenter.setValidEmail = true

        homeViewController.subscribeTapped(UIButton())

        XCTAssertEqual(homeViewController.errorLabel.text, "")
    }
}


class MockHomePresenter: HomePresenterProtocol {
    var setValidEmail = true
    func isValid(_ email: String) -> Bool {
        return setValidEmail
    }
}
