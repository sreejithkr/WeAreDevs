//
//  BaseRequest.swift
//  WeAreDevs
//
//  Created by sreejitkr on 19/11/19.
//  Copyright © 2019 SKR. All rights reserved.
//

import Foundation

protocol BaseRequest {
    associatedtype Response: BaseResponse
    var url: URL {get}
    var relativePath: String {get}
    var basePath: String {get}
    var headers: [String:Any]? { get }
    func parse(data: Data?, response: URLResponse?, error: Error?) -> Response
    func handleError(data: Data?, error: Error?) -> Response
}
