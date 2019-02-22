//
//  EventCell.swift
//  MDB_Socials
//
//  Created by Andrew Santoso on 2/21/19.
//  Copyright © 2019 Andrew Santoso. All rights reserved.
//

import Foundation
import UIKit

class EventCell: UICollectionViewCell {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
//        imageView.image = UIImage(named: "pikachu.png")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var eventNameLabel: UILabel = {
        let eventNameLabel = UILabel()
        eventNameLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 22)
        eventNameLabel.textColor = .black
        eventNameLabel.text = "Meet the Members"
//        eventNameLabel.backgroundColor = .blue
        eventNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return eventNameLabel
    }()
    
    lazy var posterLabel: UILabel = {
        let posterLabel = UILabel()
        posterLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 13)
        posterLabel.textColor = .black
        posterLabel.text = "Sam Lee"
//        posterLabel.backgroundColor = .green
        posterLabel.translatesAutoresizingMaskIntoConstraints = false
        return posterLabel
    }()
    
    lazy var rsvpLabel: UILabel = {
        let rsvpLabel = UILabel()
        rsvpLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 13)
        rsvpLabel.textColor = .black
        rsvpLabel.textAlignment = .right
        rsvpLabel.text = "421 Interested"
//        rsvpLabel.backgroundColor = .orange
        rsvpLabel.translatesAutoresizingMaskIntoConstraints = false
        return rsvpLabel
    }()
    
    var event: Event? {
        didSet {
            if let event = event {
                eventNameLabel.text = event.name
                rsvpLabel.text = "4 Interested"
                posterLabel.text = "Samantha Lee"
                firebaseClient.getEventImage(name: event.name) { (image) in
                    if image == nil {
                        print("IMAGE IS NIL")
                    } else {
                        self.imageView.image = image
                        print("SET IMAGE")
                    }
                }
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        backgroundColor = .purple
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
