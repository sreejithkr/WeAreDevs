//
//  ServiceManager.swift
//  WeAreDevs
//
//  Created by sreejitkr on 18/11/19.
//  Copyright © 2019 SKR. All rights reserved.
//

import Foundation

class ServiceManager: BaseServiceManager {
    
    private let session: URLSession
    private var dataTask: URLSessionDataTask?

    required init() {
        self.session = URLSession(configuration: .default)
    }

    func getData<T>(for request: T,
                completion: ((T.Response) -> ())?) where T: BaseRequest {
        dataTask = session.dataTask(with: request.url) { [weak self] data, response, error in
          defer {
            self?.dataTask = nil
          }
          let response = request.parse(data: data, response: response, error: error)
          completion?(response)
        }
        dataTask?.resume()
    }
}
