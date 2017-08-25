//
//  NameGame.swift
//  NameThatPerson
//
//  Created by Ilias Basha on 8/24/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import Foundation

class NameGame {
    
    let question: String
    let answer: Person
    let answerChoices: [Person]
    
    static let numberPeople = 6
    
    init(question: String, answer: Person, answerChoices: [Person]) {
        self.question = question
        self.answer = answer
        self.answerChoices = answerChoices
    }
}
