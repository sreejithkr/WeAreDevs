//
//  BaseServiceManager.swift
//  WeAreDevs
//
//  Created by sreejitkr on 19/11/19.
//  Copyright © 2019 SKR. All rights reserved.
//

import Foundation

protocol BaseServiceManager {
    init()
    func getData<T>(for request: T,
                  completion: ((T.Response) -> ())?) where T: BaseRequest
}
