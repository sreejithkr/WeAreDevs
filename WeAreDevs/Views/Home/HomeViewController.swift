//
//  HomeViewController.swift
//  WeAreDevs
//
//  Created by sreejitkr on 18/11/19.
//  Copyright © 2019 SKR. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    lazy var presenter = HomePresenter()
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
        destination.setMovieRequest(request: request)
        self.show(destination, sender: self)

    }

    @IBAction func subscribeTapped(_ sender: UIButton) {
        guard let email = emailTextField.text, !email.isEmpty else {
            errorLabel.text = "Enter a valid email address."
            return
        }
        if presenter.isValid(email) {
            //Do Make subscription
            errorLabel.text = ""
        } else {
            errorLabel.text = "Entered email is invalid."
        }
    }
}

