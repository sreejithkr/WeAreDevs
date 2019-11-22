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
    override func setUp() {
        homeViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "homeViewController") as? HomeViewController
        _ = homeViewController.view
    }

    func testShouldVerifyIfTextFieldIsEmpty() {
        XCTAssertTrue(homeViewController.errorLabel.text!.isEmpty)

        homeViewController.subscribeTapped(UIButton())

        XCTAssertEqual(homeViewController.errorLabel.text, "Enter a valid email address.")
    }

    func testShouldVerifyIfTextFieldHasAnInvalidEmail() {
        homeViewController.emailTextField.text = "george89@email.co.in"

        homeViewController.subscribeTapped(UIButton())

        XCTAssertEqual(homeViewController.errorLabel.text, "Entered email is invalid.")
//        XCTAssertEqual(homeViewController.errorLabel.text, "")

    }

    func testShouldVerifyIfTextFieldHasValidEmail() {
        homeViewController.emailTextField.text = "george89@email.com"

        homeViewController.subscribeTapped(UIButton())

        XCTAssertEqual(homeViewController.errorLabel.text, "")
    }
}
