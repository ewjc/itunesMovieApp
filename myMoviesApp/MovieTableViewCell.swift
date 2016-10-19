//
//  MovieTableViewCell.swift
//  myMoviesApp
//
//  Created by Eric Wong on 10/14/16.
//  Copyright © 2016 makeschool. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieGEnre: UILabel!
    @IBOutlet weak var ratingsLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
