//
//  PersonTableViewCell.swift
//  NameThatPerson
//
//  Created by Ilias Basha on 8/24/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func update(person: Person) {
        DispatchQueue.main.async {
            self.selectButton.setTitle("This one?", for: .normal)
            self.photo?.image = person.imageData()
        }
        
    }
    
    
    @IBOutlet var photo: UIImageView!
    @IBOutlet var selectButton: UIButton!
    
    
    @IBAction func buttonTapped(_ sender: Any) {
    }
    
}
