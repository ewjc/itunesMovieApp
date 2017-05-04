//
//  MovieClass.swift
//  myMoviesApp
//
//  Created by Eric Wong on 10/17/16.
//  Copyright © 2016 makeschool. All rights reserved.
//

import Foundation

struct Movie {
    var movieTitle: String
    var movieArtist: String
    var movieGenre: String
    var movieImage: String
    var duration: String 
    var movieReleased: String
    var moviePrice: String
    
    init(movieTitle: String, movieArtist: String, movieGenre: String, movieImage: String, duration: String, movieReleased: String, moviePrice: String) {
        self.movieTitle = movieTitle
        self.movieArtist = movieArtist
        self.movieGenre = movieGenre
        self.movieImage = movieImage
        self.duration = duration
        self.movieReleased = movieReleased
        self.moviePrice = moviePrice
    }
    
    
    func convertToDictionary() -> [String: String] {
        var dictionary = [String:String]()
        
        dictionary["movieTitle"] = movieTitle
        dictionary["movieArtist"] = movieArtist
        dictionary["movieGenre"] = movieGenre
        dictionary["movieImage"] = movieImage
        dictionary["duration"] = duration
        dictionary["movieReleased"] = movieReleased
        dictionary["moviePrice"] = moviePrice
        
        return dictionary
    }
    
    init(dictionary:[String:String]) {
        self.movieTitle = dictionary["movieTitle"]!
        self.movieArtist = dictionary["movieArtist"]!
        self.movieGenre = dictionary["movieGenre"]!
        self.movieImage = dictionary["movieImage"]!
        self.duration = dictionary["duration"]!
        self.movieReleased = dictionary["movieReleased"]!
        self.moviePrice = dictionary["moviePrice"]!
    }
    
}
