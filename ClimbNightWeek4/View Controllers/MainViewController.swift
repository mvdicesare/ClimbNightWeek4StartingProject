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
    @IBOutlet weak var jokesTableView: UITableView!
    
    // MARK: - Properties
    var numberOfJokes: Int = 50
    var jokes: [MVDJoke] = []
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jokesTableView.delegate = self
        jokesTableView.dataSource = self
        updateViews()
    }
    
    // MARK: - Actions
    
    @IBAction func numberOfJokesSlider(_ sender: UISlider) {
        numberOfJokes = Int(round(sender.value))
        numberOfJokesLabel.text = "\(numberOfJokes)"
    }
    
    @IBAction func getJokeButtonTapped(_ sender: Any) {
        guard let firstName = firstNameTextField.text, firstName.isEmpty == false,
            let lastName = lastNameTextField.text, lastName.isEmpty == false
        else {
            return
        }
        MVDJokeController.fetchJokes(withFirstName: firstName, lastName: lastName, numberOfJokes: numberOfJokes) { (jokes) in
            DispatchQueue.main.async {
                if let jokes = jokes {
                    self.jokes = jokes
                    self.jokesTableView.reloadData()
                } else {
                    print("we got problems")
                }
            }
        }
    }
    
    // MARK: - Custom Functions
    
    func updateViews() {
        getJokesButton.layer.cornerRadius = getJokesButton.frame.height / 2
        numberOfJokesLabel.text = "\(numberOfJokes)"
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return jokes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = jokesTableView.dequeueReusableCell(withIdentifier: "jokeCell", for: indexPath) as? MVDJokeTableViewCell else { return UITableViewCell()
        }
        cell.joke = jokes[indexPath.row]
        return cell
    }
}
