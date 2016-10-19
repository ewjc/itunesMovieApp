//
//  iTunesMovieAPI.swift
//  myMoviesApp
//
//  Created by Eric Wong on 10/14/16.
//  Copyright © 2016 makeschool. All rights reserved.
//

import Foundation

protocol iTunesMovieAPIDelegate{
    func didLoadMovies()
}

class ITunesMovieAPI {
    
    var moviesArray: [Movie] = []
    var delegate: iTunesMovieAPIDelegate?
    
    func requestMovieAPI() {
        
        let urlString: String = "https://itunes.apple.com/us/rss/topmovies/limit=25/json"
        let session = URLSession.shared
        let url = URL(string: urlString)
        
        let task = session.dataTask(with: url!) { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            
            
            if let data = data {
            
                let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                
                let feed = json["feed"] as! NSDictionary
                let entry = feed["entry"] as! [AnyObject]
                
                for movie in entry {
                    
                    let movieId = movie as! NSDictionary
                    let name = movieId["im:name"] as! NSDictionary
                    
                    //Gets Title of movie
                    let title = name["label"] as! NSString
                    print(title)
                    
                    //Gets Price of movie
                    let priceFolder = movieId["im:price"] as! NSDictionary
                    let price = priceFolder["label"] as! NSString
                    print(price)
                
                    //Gets Artist of the movie
                    let artistFolder = movieId["im:artist"] as! NSDictionary
                    let artist = artistFolder["label"] as! NSString
                    print(artist)
                
                    //Gets Release date of movie
                    let releaseDateFolder = movieId["im:releaseDate"] as! NSDictionary
                    let attributesRDF = releaseDateFolder["attributes"] as! NSDictionary
                    let releaseDate = attributesRDF["label"] as! NSString
                    print(releaseDate)
                
                
                    //Gets Category of movie
                    let categoryFolder = movieId["category"] as! NSDictionary
                    let attributesCF = categoryFolder["attributes"] as! NSDictionary
                    let category = attributesCF["label"] as! NSString
                    print(category)
                
                    //Gets Duration of movie
                    let linkFolder = movieId["link"] as! NSArray
                    let linkIndex = linkFolder[1] as! NSDictionary
                    let durationFolder = linkIndex["im:duration"] as! NSDictionary
                    let duration = durationFolder["label"] as! NSString
                    print(duration)
                
                    //Gets Image of movie
                    let imageFolder = movieId["im:image"] as! NSArray
                    let imageIndex = imageFolder[2] as! NSDictionary
                    let image = imageIndex["label"] as! NSString
                    print(image)
                
                    let movie = Movie(movieTitle: title as String,
                                  movieArtist: artist as String,
                                  movieGenre: category as String,
                                  movieImage: image as String,
                                  duration: duration as String,
                                  movieReleased: releaseDate as String,
                                  moviePrice: price as String
                    )
                
                    self.moviesArray.append(movie)
                }
                
                if let delegate = self.delegate {
                    DispatchQueue.main.async {
                        delegate.didLoadMovies()
                    }
                }
                ///.... reload Table View here
            
            }
        }
        
        task.resume()
        
    }

}
