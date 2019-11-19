//
//  MovieListPresenter.swift
//  WeAreDevs
//
//  Created by sreejitkr on 19/11/19.
//  Copyright © 2019 SKR. All rights reserved.
//

import Foundation

class MovieListPresenter {
    lazy var service = ServiceManagerRegistry.getServiceManager().init()
    var data: [Movie] = []
    func loadData(request: MovieListRequest, competion: (([Movie])->())? ) {
           service.getData(for: request) { (response) in
               DispatchQueue.main.async {[unowned self] in
                   guard let data = response.data else { return }
                   self.data = data
                  competion?(data)
               }
           }
       }
}
