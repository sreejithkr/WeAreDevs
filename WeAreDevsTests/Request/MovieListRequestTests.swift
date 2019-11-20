//
//  MovieListRequestTests.swift
//  WeAreDevsTests
//
//  Created by sreejitkr on 20/11/19.
//  Copyright © 2019 SKR. All rights reserved.
//

import XCTest
@testable import WeAreDevs

class MovieListRequestTests: XCTestCase {

    var movieListRequest: MovieListRequest!
    
    override func setUp() {
        movieListRequest = MovieListRequest(relativePath: "movies")
    }

    override func tearDown() {
    }
    
    func testIfRelativePathSet() {
        //Convention you can follow is expected result then the teting entity,
        //per your project guidelines
        XCTAssertEqual("movies", movieListRequest.relativePath)
    }
    
    func testIfBasePathSetToCurrentEvironment() {
        XCTAssertEqual(AppConfig.current.environment.basePath, movieListRequest.basePath)
    }
    
    func testParseMethodReturnsMovieListForValidData() {
        let mockJSONData = JsonHandler.getJSON(id: movieListRequest.relativePath)
        let response = movieListRequest.parse(data: mockJSONData, response: nil, error: nil)
        XCTAssertNotNil(response.data)
        XCTAssertTrue(response.data?.count ?? 0 > 0)
    }
    
    func testParseMethodReturnsErrorForInValidData() {
        let response1 = movieListRequest.parse(data: Data(), response: nil, error: nil)
        XCTAssertNil(response1.data)
        XCTAssertNotNil(response1.error)
    }
    
    func testParseMethodReturnsErrorForNilData() {
        let response2 = movieListRequest.parse(data: nil, response: nil, error: nil)
        XCTAssertNil(response2.data)
        XCTAssertNotNil(response2.error)
    }
    
    func testHandleErrorReturnsError() {
        let response1 = movieListRequest.handleError(data: nil, error: MockError())
        XCTAssertNil(response1.data)
        XCTAssertNotNil(response1.error)
    }
    
    func testHandleErrorDoesNotReturnsErrorForDataNotNilAndErrorNil() {
        let response1 = movieListRequest.handleError(data: Data(), error: nil)
        XCTAssertNil(response1.data)
        XCTAssertNil(response1.error)
    }

}

fileprivate struct MockError : Error {
    
}
