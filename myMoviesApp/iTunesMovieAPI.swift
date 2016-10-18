//
//  iTunesMovieAPI.swift
//  myMoviesApp
//
//  Created by Eric Wong on 10/14/16.
//  Copyright © 2016 makeschool. All rights reserved.
//

import Foundation

class ITunesMovieAPI {
    
    func requestMovieAPI() {
        
        let urlString: String = "https://itunes.apple.com/us/rss/topmovies/limit=25/json"
        let session = URLSession.shared
        let url = URL(string: urlString)
        
        let task = session.dataTask(with: url!) { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            
            
            if let data = data {
                print("Hello Eric")
                
                let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                
                let feed = json["feed"] as! NSDictionary
                let entry = feed["entry"] as! NSArray
                
                var movies: [Movie] = []
                
                let movieId = entry[0] as! NSDictionary
                let name = movieId["im:name"] as! NSDictionary
                
                //Gets Artist of the movie
                let artist = movieId["im:artist"] as! NSDictionary
                
                //Gets Release date of movie
                let releaseDateFolder = movieId["im:releaseDate"] as! NSDictionary
                let attributesRDF = releaseDateFolder["attributes"] as! NSDictionary
                let releaseDate = attributesRDF["label"] as! NSString
                print(releaseDate)
                
                //Gets Title of movie
                let title = name["label"] as! NSString
                
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
                
            }
            
            

            }
        
        task.resume()
        
    }

}
