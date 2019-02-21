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
        imageView.image = UIImage(named: "pikachu.png")
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
        posterLabel.text = "Andrew Santoso"
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        backgroundColor = .purple
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
