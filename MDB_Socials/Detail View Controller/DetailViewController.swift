//
//  ViewController.swift
//  MDB_Socials
//
//  Created by Andrew Santoso on 2/13/19.
//  Copyright © 2019 Andrew Santoso. All rights reserved.
//

import UIKit
import Firebase

class DetailViewController: UIViewController {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var eventNameLabel: UILabel = {
        let eventNameLabel = UILabel()
        eventNameLabel.backgroundColor = .white
        eventNameLabel.textAlignment = .center
        eventNameLabel.text = "Meet the Members"
        eventNameLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 18)
        eventNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return eventNameLabel
    }()
    
    lazy var postedNameLabel: UILabel = {
        let postedNameLabel = UILabel()
        postedNameLabel.backgroundColor = .white
        postedNameLabel.textAlignment = .center
        postedNameLabel.text = "Created by Andrew Santoso"
        postedNameLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 14)
        postedNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return postedNameLabel
    }()
    
    lazy var interestedButton: UIButton = {
        let frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        let interestedButton = CircleCategoryButton(frame: frame, categoryName: "Interested", regularBackgroundColor: .white, regularTextColor: .black, selectedBackgroundColor: Constants.correctGreen, selectedTextColor: .white)
        interestedButton.translatesAutoresizingMaskIntoConstraints = false
        return interestedButton
    }()
    
    lazy var rsvpLabel: UILabel = {
        let rsvpLabel = UILabel()
        rsvpLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 13)
        rsvpLabel.textColor = .black
        rsvpLabel.textAlignment = .center
        rsvpLabel.text = "421 Interested"
        rsvpLabel.translatesAutoresizingMaskIntoConstraints = false
        return rsvpLabel
    }()
    
    lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 13)
        descriptionLabel.textColor = .black
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        return descriptionLabel
    }()
    
    var event: Event? {
        didSet {
            if let event = event {
                self.eventNameLabel.text = event.name
                self.rsvpLabel.text = "4 RSVP"
                self.postedNameLabel.text = "Sam Lee"
                self.descriptionLabel.text = event.description
            }
        }
    }
    
    var image: UIImage? {
        didSet {
            if let im = image {
                self.imageView.image = im
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
    }
}

