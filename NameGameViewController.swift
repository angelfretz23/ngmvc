//
//  NameGameViewController.swift
//  NameThatPerson
//
//  Created by Ilias Basha on 8/24/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import UIKit

class NameGameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        PersonController.sharedInstance.fetchPeople { (people) in
            if let people = people {
                let nameGame = NameGameController.sharedInstance.createNameGameWith(NameGame.numberPeople, people: people)
                
                self.answers = nameGame.answerChoices
                self.answer = nameGame.answer
                
                DispatchQueue.main.async {
                    self.questionLabel.text = "Who is \(nameGame.answer.fullName)?"
                    self.tableView.reloadData()
                }
            }
        }
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PersonTableViewCell.self, forCellReuseIdentifier: "pictureCell")
    }
    
    
    // Properties
    var answers: [Person]?
    var answer: Person?
    
    // Outlets
    @IBOutlet var tableView: UITableView!
    @IBOutlet var questionLabel: UILabel!
    
}


extension NameGameViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answers?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pictureCell", for: indexPath) as? PersonTableViewCell
        guard let person = answers?[indexPath.row] else { return UITableViewCell() }
        cell?.updateWith(person: person)
        return cell ?? UITableViewCell()
    }
}
