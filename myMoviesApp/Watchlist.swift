//
//  Watchlist.swift
//  myMoviesApp
//
//  Created by Eric Wong on 10/28/16.
//  Copyright © 2016 makeschool. All rights reserved.
//

import Foundation

class Watchlist {
    
    var watchedMoviesArray = [Movie]()
    
    // init()
    
    func addToWatchList(movie: Movie) {
        watchedMoviesArray.append(movie)
        saveDefaults()
    }
    
    // func addToDefaults
    
    func saveDefaults() {
        var array = [[String:String]]()
        for movie in watchedMoviesArray {
            array.append(movie.convertToDictionary())
        }
        
        // save array to user defaults
        UserDefaults.standard.set(array, forKey: "WatchList")
        UserDefaults.standard.synchronize()
    }
    
    func loadDefaults() {
        if let watchedMoviesArray = UserDefaults.standard.object(forKey: "WatchList") {
            self.watchedMoviesArray = watchedMoviesArray as! [[Movie]]
            
            // self.watchedMoviesArray = watchedMoviesArray as! [[String:String]] as! [Movie]
        }
    }
    
    
}
