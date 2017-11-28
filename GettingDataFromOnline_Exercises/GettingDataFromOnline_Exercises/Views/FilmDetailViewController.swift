//
//  FilmDetailViewController.swift
//  GettingDataFromOnline_Exercises
//
//  Created by C4Q on 11/27/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class FilmDetailViewController: UIViewController {
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    var film: Film! //Used a variable when you don't know what the variable is  going to be yet
    
   // var film2 = Film() //This you already know what the value will be 
    

    override func viewDidLoad() {
        super.viewDidLoad()
        movieTitleLabel.text = film.title
        descriptionTextView.text = film.description
        releaseDateLabel.text = film.release_date
    }
}
