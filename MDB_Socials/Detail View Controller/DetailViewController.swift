//
//  ViewController.swift
//  MDB_Socials
//
//  Created by Andrew Santoso on 2/13/19.
//  Copyright © 2019 Andrew Santoso. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "Family.jpg")
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
        let interestedButton = UIButton()
        interestedButton.setTitle("Interested", for: .normal)
        interestedButton.backgroundColor = Constants.correctGreen
        interestedButton.translatesAutoresizingMaskIntoConstraints = false
        return interestedButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        setupViews()
        
    }
}

