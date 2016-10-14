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
            
                let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                
                let feed = json["feed"] as! NSDictionary
                let entry = feed["entry"] as! NSArray
                let movieId = entry[0] as! NSDictionary
                let name = movieId["im:name"] as! NSDictionary
                let title = name["label"] as! NSString

                }
            }
        
        task.resume()
        
    }

}
