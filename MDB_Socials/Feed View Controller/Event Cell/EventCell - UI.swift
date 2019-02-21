//
//  EventCell - UI.swift
//  MDB_Socials
//
//  Created by Andrew Santoso on 2/21/19.
//  Copyright © 2019 Andrew Santoso. All rights reserved.
//

import Foundation
import UIKit

extension EventCell {
    
    func setupViews() {
        
        contentView.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    
        contentView.addSubview(eventNameLabel)
        eventNameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        eventNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        eventNameLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width * 0.7).isActive = true
        eventNameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        contentView.addSubview(rsvpLabel)
        rsvpLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        rsvpLabel.leadingAnchor.constraint(equalTo: eventNameLabel.trailingAnchor).isActive = true
        rsvpLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width * 0.3).isActive = true
        rsvpLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        contentView.addSubview(posterLabel)
        posterLabel.topAnchor.constraint(equalTo: eventNameLabel.bottomAnchor).isActive = true
        posterLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        posterLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        posterLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
}
