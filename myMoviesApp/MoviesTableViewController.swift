//
//  MoviesTableViewController.swift
//  myMoviesApp
//
//  Created by Eric Wong on 10/14/16.
//  Copyright © 2016 makeschool. All rights reserved.
//

import UIKit

class MoviesTableViewController: UITableViewController, iTunesMovieAPIDelegate {

    var myItunes = ITunesMovieAPI()
    
    func didLoadMovies() {
        tableView.reloadData()
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(">>>>>>>>>>>>>>>>>>>>>>>")
        
        myItunes.delegate = self
        myItunes.requestMovieAPI()
        myItunes.moviesArray = []
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myItunes.moviesArray.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieTableViewCell

        cell.movieTitle.text? = myItunes.moviesArray[indexPath.row].movieTitle
        cell.movieGEnre.text? = myItunes.moviesArray[indexPath.row].movieGenre
        cell.ratingsLabel.text? = "N/A"
        
        
        
        

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "segueToVC") {
//            print(sender)
            let cell = sender as! UITableViewCell
            let indexPathOfCell = tableView.indexPath(for: cell)
            
//            print(indexPathOfCell, indexPathOfCell?.row)
            if let destinationVC = segue.destination as? DetailedViewController {
                
                destinationVC.movie = myItunes.moviesArray[indexPathOfCell!.row]
                
            }
            
        }
            
        }
    }

