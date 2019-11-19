//
//  ServiceManagerRegistry.swift
//  WeAreDevs
//
//  Created by sreejitkr on 19/11/19.
//  Copyright © 2019 SKR. All rights reserved.
//

import Foundation

class ServiceManagerRegistry {
    private static var registry: BaseServiceManager.Type!
    
    static func setRegistry(registry: BaseServiceManager.Type) {
        ServiceManagerRegistry.registry = registry
    }
    
    static func getServiceManager() -> BaseServiceManager.Type {
           return ServiceManagerRegistry.registry
    }
}
