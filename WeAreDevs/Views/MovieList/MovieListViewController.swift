//
//  MovieListViewController.swift
//  WeAreDevs
//
//  Created by sreejitkr on 19/11/19.
//  Copyright © 2019 SKR. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController {
    lazy var service = ServiceManager(session: URLSession(configuration: .default))
    var request: MovieListRequest?
    var data: [Movie] = []
    let movieListIdentifier =  "movieListIdentifier"
    @IBOutlet var movieTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        loadData()
    }

    private func setup(){
        movieTableView.delegate = self
        movieTableView.dataSource = self
        movieTableView.register(UITableViewCell.self, forCellReuseIdentifier: movieListIdentifier)
    }

    private func loadData() {
        guard let request = request else {return}
        service.getData(for: request) { (response) in
            DispatchQueue.main.async {[unowned self] in
                guard let data = response.data else { return }
                self.data = data
                self.movieTableView.reloadData()
            }
        }
    }
    
}

