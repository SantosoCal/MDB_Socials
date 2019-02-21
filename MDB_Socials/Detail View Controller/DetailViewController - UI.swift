//
//  DetailViewController - UI.swift
//  MDB_Socials
//
//  Created by Andrew Santoso on 2/20/19.
//  Copyright © 2019 Andrew Santoso. All rights reserved.
//

import Foundation
import UIKit

extension DetailViewController {
    
    func setupViews() {
        
        view.backgroundColor = .white
        
        view.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        view.addSubview(eventNameLabel)
        eventNameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 15).isActive = true
        eventNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        eventNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        eventNameLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(postedNameLabel)
        postedNameLabel.topAnchor.constraint(equalTo: eventNameLabel.bottomAnchor, constant: -10).isActive = true
        postedNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        postedNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        postedNameLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(interestedButton)
        interestedButton.topAnchor.constraint(equalTo: postedNameLabel.bottomAnchor, constant: 15).isActive = true
        interestedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        interestedButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        interestedButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

        
    }
    

}
