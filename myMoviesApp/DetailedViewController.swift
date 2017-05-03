//
//  DetailedViewController.swift
//  myMoviesApp
//
//  Created by Eric Wong on 10/19/16.
//  Copyright © 2016 makeschool. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {
    
    
    var addToList = true
    var markWatched = true
    var movie: Movie?
    
    
    
    
    // MARK: - IBOutlets
    
    @IBOutlet var starButtons: [UIButton]!
    @IBOutlet weak var starsStackView: UIStackView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieArtist: UILabel!
    @IBOutlet weak var movieGenre: UILabel!
    @IBOutlet weak var durationStaticTitle: UILabel!
    @IBOutlet weak var durationOfMovie: UILabel!
    @IBOutlet weak var priceStaticTitle: UILabel!
    @IBOutlet weak var priceOfMovie: UILabel!
    @IBOutlet weak var releasedStaticTitle: UILabel!
    @IBOutlet weak var releaseOfMovie: UILabel!
    @IBOutlet weak var imageOfMovie: UIImageView!
    @IBOutlet weak var ratingStaticDescription: UILabel!
    @IBOutlet weak var markedAsWatchedLabel: UIButton!
    
   
    
    
    
    // MARK: - IBActions
    
    @IBAction func addToWatchlistButton(_ sender: AnyObject) {
        addToList = !addToList
        
        if addToList {
            sender.setTitle("Add to Watchlist", for: .normal)
        } else {
            sender.setTitle("Unadd to Watchlist", for: .normal)
        }
    }
    
    
    @IBAction func markedAsWatchedButton(_ sender: UIButton) {
        markWatched = !markWatched
        
        if markWatched {
            sender.setTitle("Mark as Watched", for: .normal)
            ratingStaticDescription.isHidden = false
            starsStackView.isHidden = true
        } else {
            sender.setTitle("Mark as Unwatched", for: .normal)
            ratingStaticDescription.isHidden = true
            starsStackView.isHidden = false
        }
    }
    
    @IBAction func ratingChaned(_ sender: UIButton) {
        print("clickable")
        print(sender.tag)
        //get tag
        let tag = sender.tag
        let goldenStar = UIImage(named: "goldstar")
        let emptyStar = UIImage(named: "emptystar")
        // loop through all buttons
        
        for button in starButtons {
            if button.tag <= tag {
                button.setBackgroundImage(goldenStar, for: .normal)
            } else {
                button.setBackgroundImage(emptyStar, for: .normal)
            }
        }
    }
    
    
    
    
    
    // MARK: - Helper Methods 
    
    
    
    
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let movie = movie {
            movieTitle.text? = movie.movieTitle
            movieArtist.text? = movie.movieArtist
            movieGenre.text? = movie.movieGenre
            releaseOfMovie.text? = movie.movieReleased
            priceOfMovie.text? = movie.moviePrice
            durationOfMovie.text? = movie.duration
            
            let urlString: String = movie.movieImage
            let session = URLSession.shared
            let url = URL(string: urlString)
            
            let dataTask = session.dataTask(with: url!, completionHandler: { (data: Data?, URLResponse: URLResponse?, error: Error?) in
                if let data = data {
                    self.imageOfMovie.image = UIImage(data: data)
                }
            })
            dataTask.resume()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}
