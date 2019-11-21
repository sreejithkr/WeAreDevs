//
//  MovieListPresenter.swift
//  WeAreDevs
//
//  Created by sreejitkr on 19/11/19.
//  Copyright © 2019 SKR. All rights reserved.
//

import Foundation

class MovieListPresenter {
    lazy var serviceManager = DependancyRegistry.getServiceManagerType().init()
    var data: [Movie] = []
    func loadData(request: MovieListRequest, competion: (([Movie])->())? ) {
           serviceManager.getData(for: request) { (response) in
               DispatchQueue.main.async {[unowned self] in
                   guard let data = response.data else { return }
                   self.data = data
                  competion?(data)
               }
           }
       }
}
