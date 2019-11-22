//
//  MovieListViewController.swift
//  WeAreDevs
//
//  Created by sreejitkr on 19/11/19.
//  Copyright © 2019 SKR. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController {
    lazy var presenter: MovieListPresenter = MovieListPresenter()
    let movieListIdentifier =  "movieListIdentifier"
    @IBOutlet var movieTableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        loadData()
    }
    
    func setMovieRequest(request: MovieListRequest) {
        presenter.request = request
    }

    private func setup(){
        movieTableView.delegate = self
        movieTableView.dataSource = self
        movieTableView.register(UITableViewCell.self, forCellReuseIdentifier: movieListIdentifier)
    }

    private func loadData() {
        presenter.loadData() { (data) in
            self.movieTableView.reloadData()
        }
    }
}

