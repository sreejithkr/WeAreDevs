//
//  HomeViewController.swift
//  WeAreDevs
//
//  Created by sreejitkr on 18/11/19.
//  Copyright © 2019 SKR. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
    }

    @IBAction func displayAllMovies(_ sender: UIButton) {
        let request = MovieListRequest(relativePath : "movies")
        
        navigate(with: request)
    }
    
    @IBAction func displayLatestMovies(_ sender: UIButton) {
           
    }
    @IBAction func displayTopMovies(_ sender: UIButton) {
           
    }
    
    private func navigate(with request: MovieListRequest) {
        guard let destination  = storyboard?.instantiateViewController(identifier: ViewControllerNames.movieListViewController.value) as? MovieListViewController else { return }
        destination.request = request
        self.show(destination, sender: self)

    }

}

