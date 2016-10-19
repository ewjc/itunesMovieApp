//
//  DetailedViewController.swift
//  myMoviesApp
//
//  Created by Eric Wong on 10/19/16.
//  Copyright © 2016 makeschool. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {
    
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
    @IBAction func ratingChaned(_ sender: AnyObject) {
    }
    
    
    if let url = NSURL(string: movie.movieImage) {
        if let data = NSData(contentsOfURL: url) {
            imageURL.image = UIImage(data: data)
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
//            imageOfMovie.text? = movie.movieImage
            releaseOfMovie.text? = movie.movieReleased
            priceOfMovie.text? = movie.moviePrice
            durationOfMovie.text? = movie.duration
            
            
        }

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}
