//
//  ViewController.swift
//  myMoviesApp
//
//  Created by Eric Wong on 10/14/16.
//  Copyright © 2016 makeschool. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var myItunes = ITunesMovieAPI()
        myItunes.requestMovieAPI()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

