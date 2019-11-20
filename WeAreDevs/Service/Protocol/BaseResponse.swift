//
//  Response.swift
//  WeAreDevs
//
//  Created by sreejitkr on 18/11/19.
//  Copyright © 2019 SKR. All rights reserved.
//

import Foundation

protocol BaseResponse {
    associatedtype Response
    associatedtype Error
    var error: Error? {get set}
    var data: Response? {get set}
    init() 
}


