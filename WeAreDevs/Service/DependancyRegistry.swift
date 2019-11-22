//
//  ServiceManagerRegistry.swift
//  WeAreDevs
//
//  Created by sreejitkr on 19/11/19.
//  Copyright © 2019 SKR. All rights reserved.
//

import Foundation
//This can be extended to hold a dic
class DependancyRegistry {
    private static var registry: BaseServiceManager.Type!
    
    static func setServiceManagerType(registry: BaseServiceManager.Type) {
        DependancyRegistry.registry = registry
    }
    
    static func getServiceManagerType() -> BaseServiceManager.Type {
           return DependancyRegistry.registry
    }
}
