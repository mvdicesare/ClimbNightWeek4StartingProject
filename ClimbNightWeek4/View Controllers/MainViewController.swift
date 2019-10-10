//
//  MainViewController.swift
//  ClimbNightWeek4
//
//  Created by Jackson Tubbs on 10/10/19.
//  Copyright © 2019 Jax Tubbs. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var numberOfJokesLabel: UILabel!
    @IBOutlet weak var numberOfJokesSlider: UISlider!
    @IBOutlet weak var getJokesButton: UIButton!
    
    // MARK: - Properties
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    // MARK: - Actions
    

    // MARK: - Custom Functions
    
    func updateViews() {
        getJokesButton.layer.cornerRadius = getJokesButton.frame.height / 2
    }
}
