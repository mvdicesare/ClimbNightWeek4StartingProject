//
//  MVDJokeTableViewCell.swift
//  ClimbNightWeek4
//
//  Created by Michael Di Cesare on 10/10/19.
//  Copyright © 2019 Jax Tubbs. All rights reserved.
//

import UIKit

class MVDJokeTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var jokeLabel: UILabel!
    @IBOutlet weak var catagoryLabel: UILabel!
    
    // MARK: - Properties
    
    var joke: MVDJoke?{
        didSet{
            updateViewForJoke()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    // MARK: - custome func
    
    func updateViewForJoke(){
        guard let joke = joke else {return}
        jokeLabel.text = joke.joke
        
        var combindCategoriesString: String = ""
        for catagory in joke.categories {
            combindCategoriesString += catagory + " "
        }
        catagoryLabel.text = combindCategoriesString
    }
    
}
