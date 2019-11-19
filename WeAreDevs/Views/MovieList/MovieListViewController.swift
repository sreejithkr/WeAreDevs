//
//  MovieListViewController.swift
//  WeAreDevs
//
//  Created by sreejitkr on 19/11/19.
//  Copyright © 2019 SKR. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController {
    var request: MovieListRequest?
    lazy var presenter: MovieListPresenter = MovieListPresenter()
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
        presenter.loadData(request: request) { (data) in
            self.movieTableView.reloadData()
        }
    }
}

