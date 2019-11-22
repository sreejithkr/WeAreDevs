//
//  HomePresenter.swift
//  WeAreDevs
//
//  Created by Saravanakumar Selladurai on 21/11/19.
//  Copyright © 2019 SKR. All rights reserved.
//

import Foundation

class HomePresenter {
    func isValid(_ email: String) -> Bool {

        let pattern = "[A-Z0-9a-z._]+@[A-Z0-9a-z]{0,16}?\\.[A-Za-z]{2,}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", pattern)

        return predicate.evaluate(with: email)
    }
}


/**
 //Alternate regex         let pattern = "[A-Z0-9a-z._]+@[A-Z0-9a-z]{0,16}?\\.[A-Za-z.]{2,}"
 */
