//
//  NameGameController.swift
//  NameThatPerson
//
//  Created by Ilias Basha on 8/24/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import Foundation

class NameGameController {
    
    // Singleton
    static let sharedInstance = NameGameController()
    
    
    func createNameGameWith(_ numberPeople: Int, people: [Person]) -> NameGame {
        let answerChoices = pickRandomPeopleFrom(array: people)
        
        let randomIndex = Int(arc4random_uniform(UInt32(answerChoices.count)))
        
        let answer = answerChoices[randomIndex]
        let question = "Who is \(answer.fullName)?"
        let nameGame = NameGame(question: question, answer: answer, answerChoices: answerChoices)
        
        return nameGame
    }
    
    
    func pickRandomPeopleFrom(array: [Person]) -> [Person]{
        var answers: [Person] = []
        while answers.count < 6 {
            let randomIndex = Int(arc4random_uniform(UInt32(array.count)))
            let randomPerson = array[randomIndex]
            answers.append(randomPerson)
        }
        return answers
    }

    
    
}
