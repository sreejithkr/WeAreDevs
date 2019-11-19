//
//  JsonHandler.swift
//  WeAreDevsTests
//
//  Created by sreejitkr on 19/11/19.
//  Copyright © 2019 SKR. All rights reserved.
//

import Foundation

class JsonHandler {
    
    static func getJSON(id: String) -> Data?  {
        let resourcePath = Bundle(for: JsonHandler.self).path(forResource: id, ofType: "json") ?? ""
        return NSData(contentsOfFile: resourcePath) as Data?
    }
}
