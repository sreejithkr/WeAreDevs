//
//  ViewControllerName.swift
//  WeAreDevs
//
//  Created by sreejitkr on 19/11/19.
//  Copyright © 2019 SKR. All rights reserved.
//

import Foundation
typealias ViewControllerNames = Constants.ViewControllerNames
extension Constants {
    enum ViewControllerNames: String {
        case movieListViewController
        
        var value: String {
            return self.rawValue
        }
    }
}
