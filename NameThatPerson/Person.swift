//
//  Person.swift
//  NameThatPerson
//
//  Created by Ilias Basha on 8/24/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import Foundation
import UIKit

struct Person {
    
    private static let firstNameKey = "firstName"
    private static let lastNameKey = "lastName"
    private static let imageURLKey = "url"
    
    private static let headshotKey = "headshot"
    
    let firstName: String
    let lastName: String
    let imageURL: String
    
    
    var fullName: String {
        return ("\(firstName) \(lastName)")
    }
    
    init?(dictionary: [String:Any]) {
        guard let firstName = dictionary[Person.firstNameKey] as? String,
            let lastName = dictionary[Person.lastNameKey] as? String,
            let headshotsDictionary = dictionary[Person.headshotKey] as? [String:Any],
            let imageURL = headshotsDictionary[Person.imageURLKey] as? String else { return nil }
        
        
        self.firstName = firstName
        self.lastName = lastName
        self.imageURL = String(format: "http:%@", imageURL)
    }
}







