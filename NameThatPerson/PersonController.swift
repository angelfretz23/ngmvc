//
//  PersonController.swift
//  NameThatPerson
//
//  Created by Ilias Basha on 8/24/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import Foundation

class PersonController {
    
    static let sharedInstance = PersonController()
    
    let url = URL(string: "https://willowtreeapps.com/api/v1.0/profiles/")
    
    func fetchPeople(completion: @escaping (_ people: [Person]?) -> Void) {
        guard let url = self.url else { fatalError("URL optional is nil.")}
        NetworkController.performRequest(for: url, httpMethod: .get) { (data, error) in
            if let error = error {
                print("unable to perform request: \(error)")
            }
            
            guard let data = data else {
                completion([])
                return
            }
            
            guard let serializedData = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) else {
                completion([])
                return
            }
            
            guard let jsonDictionary = serializedData as? [[String:Any]] else {
                completion([])
                return
            }
            
            let people = jsonDictionary.flatMap { Person(dictionary: $0) }
            completion(people)
        }
    }
}
