//
//  PersonTableViewCell.swift
//  NameThatPerson
//
//  Created by Ilias Basha on 8/24/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import UIKit

extension UIView {
    func addConstraintsWithFormat(format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}

class PersonTableViewCell: UITableViewCell {
    
    private lazy var personImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let selectButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        button.setTitle("This one?", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        addSubview(personImageView)
        addSubview(selectButton)
        
        addConstraintsWithFormat(format: "H:|[v0(187.5)]", views: personImageView)
        addConstraintsWithFormat(format: "V:|[v0(142.5)]", views: personImageView)
        addConstraintsWithFormat(format: "H:[v0]-4-[v1]|", views: personImageView, selectButton)
        let verticalButtonConstraints = NSLayoutConstraint(item: selectButton, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0)
        addConstraint(verticalButtonConstraints)
        verticalButtonConstraints.isActive = true
    }
    
    func buttonTapped(_ sender: Any){
        
    }
    
    public func updateWith(person: Person){
        ImageController.image(forURL: person.imageURL) { (image) in
            DispatchQueue.main.async {
                self.personImageView.image = image
            }
        }
    }
}
