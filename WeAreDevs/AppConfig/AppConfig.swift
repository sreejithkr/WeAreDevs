//
//  AppConfig.swift
//  WeAreDevs
//
//  Created by sreejitkr on 19/11/19.
//  Copyright © 2019 SKR. All rights reserved.
//

import Foundation

struct AppConfig {
    static var `default`: AppConfig = AppConfig()
    var environment: Environment = Environment.prod
    enum Environment: String {
        case prod = "http://10.132.21.132:9001/",
             uitest = "mock/"
        var basePath: String {
            return self.rawValue
        }
    }
}
