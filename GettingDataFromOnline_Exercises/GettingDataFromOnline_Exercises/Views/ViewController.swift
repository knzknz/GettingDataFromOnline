//
//  ViewController.swift
//  GettingDataFromOnline_Exercises
//
//  Created by C4Q on 11/27/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var films = [Film]() {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        //Why didnt we need a delegate for the stock project? // didnt need to use a delegate method
        loadData()
    }
    
    func loadData() {
        let urlStr = "https://ghibliapi.herokuapp.com/films"
        let setFilmToOnlineFilm: ([Film]) -> Void = {(onlineFilm: [Film]) in
            self.films = onlineFilm
        }
        FilmAPIClient.manager.getFilm(from: urlStr,
                                        completionHandler: setFilmToOnlineFilm,
                                        errorHandler: {print($0)})
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count
    }
    
    //data source is how table is loaded
    //delegate is a way of talking to the tableview to do things when you interact with it

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let film = films[indexPath.row]
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Film Cell", for: indexPath)
        cell.textLabel?.text = film.title
        cell.detailTextLabel?.text = film.release_date
        return cell
    }
    //MARK -- Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? FilmDetailViewController {
            
            destination.film = films[self.tableView.indexPathForSelectedRow!.row]
        }
    }
}
