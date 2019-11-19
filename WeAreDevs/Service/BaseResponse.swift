//
//  Response.swift
//  WeAreDevs
//
//  Created by sreejitkr on 18/11/19.
//  Copyright © 2019 SKR. All rights reserved.
//

import Foundation

protocol ResponseData {
    
}

protocol ResponseError {
    
}

protocol BaseResponse {
    associatedtype Data
    associatedtype Error
    var error: Error? {get set}
    var data: Data? {get set}
    init() 
}


