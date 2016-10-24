//
//  DetailedViewController.swift
//  myMoviesApp
//
//  Created by Eric Wong on 10/19/16.
//  Copyright © 2016 makeschool. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {
    
    @IBOutlet var starButtons: [UIButton]!
    
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
    
    @IBAction func addToWatchlistButton(_ sender: AnyObject) {
    }
    
    @IBOutlet weak var markedAsWatchedLabel: UIButton!

    @IBAction func markedAsWatchedButton(_ sender: UIButton) {
        var ratingDescription = ratingStaticDescription
        var stars = starButtons
        
        if markedAsWatchedLabel.isSelected {
            ratingDescription?.isHidden = true
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
    
    var movie: Movie?

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
