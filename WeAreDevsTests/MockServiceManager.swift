//
//  MockServiceManager.swift
//  WeAreDevsTests
//
//  Created by sreejitkr on 19/11/19.
//  Copyright © 2019 SKR. All rights reserved.
//

@testable import WeAreDevs

class MockServiceManager: BaseServiceManager {
    
    var isError: Bool = false
    var mockError: Error?
    required init() {
        
    }

    func getData<T>(for request: T,
                completion: ((T.Response) -> ())?) where T: BaseRequest {
        
        if isError {
            let response = request.parse(data: nil, response: nil, error: mockError)
            completion?(response)
        } else {
            let mockJsonID =  request.relativePath
            let response = request.parse(data: JsonHandler.getJSON(id: mockJsonID), response: nil, error: nil)
            completion?(response)
        }
     
    }
}
