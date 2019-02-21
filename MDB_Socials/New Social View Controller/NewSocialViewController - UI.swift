//
//  New Social View Controller.swift
//  MDB_Socials
//
//  Created by Andrew Santoso on 2/20/19.
//  Copyright © 2019 Andrew Santoso. All rights reserved.
//

import Foundation
import UIKit

extension NewSocialViewController {
    
    func setupNavBar() {
        let navController = navigationController!
        self.title = "New Event"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(presentCameraView))
        
        navController.navigationBar.tintColor = Constants.lightBlue
        
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.font: UIFont(name: "AppleSDGothicNeo-Bold", size: 18)!]
    }
    
    func setUpViews() {
        
        view.addSubview(imageContainerView)
        [
            imageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            imageContainerView.heightAnchor.constraint(equalToConstant: 150)
            ].forEach{ $0.isActive = true }
        
        imageContainerView.addSubview(imageView)
        let newWidth = Constants.calculateImageViewSize(imageView: imageView).width
        imageView.translatesAutoresizingMaskIntoConstraints = false
        [
            imageView.topAnchor.constraint(equalTo: imageContainerView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: imageContainerView.bottomAnchor),
            imageView.centerXAnchor.constraint(equalTo: imageContainerView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: imageContainerView.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: newWidth)
            ].forEach{ $0.isActive = true }
        
        view.addSubview(descriptionView)
        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        [
            descriptionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            descriptionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            descriptionView.topAnchor.constraint(equalTo: imageContainerView.bottomAnchor, constant: 10),
            descriptionView.heightAnchor.constraint(greaterThanOrEqualToConstant: 70) //70
            //            captionView.heightAnchor.constraint(equalToConstant: 70) // later remove. Just use bottom constraints for nondynamic sizing views
            ].forEach{ $0.isActive = true }
        
        descriptionView.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        [
            descriptionLabel.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor, constant: 20), //15
            descriptionLabel.topAnchor.constraint(equalTo: descriptionView.topAnchor, constant: 2), //15
            descriptionLabel.widthAnchor.constraint(equalToConstant: 90),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 40)
            ].forEach{ $0.isActive = true }
        
        descriptionView.addSubview(descriptionTextView)
        
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        [
            descriptionTextView.topAnchor.constraint(equalTo: descriptionView.topAnchor, constant: 4), //8
            descriptionTextView.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor, constant: -8),
            descriptionTextView.leadingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor, constant: 8),
            descriptionTextView.heightAnchor.constraint(equalToConstant: 40)
            ].forEach{ $0.isActive = true }
        
        view.addSubview(nameView)
        nameView.translatesAutoresizingMaskIntoConstraints = false
        [
            nameView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            nameView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            nameView.topAnchor.constraint(equalTo: descriptionView.bottomAnchor),
            nameView.heightAnchor.constraint(equalToConstant: 65) //70 // later remove. Just use bottom constraints for nondynamic sizing views
            ].forEach{ $0.isActive = true }
        
        nameView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        [
            nameLabel.leadingAnchor.constraint(equalTo: nameView.leadingAnchor, constant: 20), //15
            nameLabel.topAnchor.constraint(equalTo: nameView.topAnchor, constant: 11), //15
            nameLabel.widthAnchor.constraint(equalToConstant: 90),
            nameLabel.heightAnchor.constraint(equalToConstant: 40)
            ].forEach{ $0.isActive = true }
        
        nameView.addSubview(nameTextField)
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        [
            nameTextField.topAnchor.constraint(equalTo: nameView.topAnchor, constant: 10),
            nameTextField.trailingAnchor.constraint(equalTo: nameView.trailingAnchor, constant: -8),
            nameTextField.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 8),
            nameTextField.heightAnchor.constraint(equalToConstant: 40)
            ].forEach{ $0.isActive = true }
        
        view.addSubview(dateView)
        [
            dateView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dateView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dateView.topAnchor.constraint(equalTo: nameView.bottomAnchor),
            dateView.heightAnchor.constraint(equalToConstant: 65 ) //70 // later remove. Just use bottom constraints for nondynamic sizing views
            ].forEach{ $0.isActive = true }
        
        dateView.addSubview(dateLabel)
        [
            dateLabel.leadingAnchor.constraint(equalTo: dateView.leadingAnchor, constant: 20), //15
            dateLabel.topAnchor.constraint(equalTo: dateView.topAnchor, constant: 11), //15
            dateLabel.widthAnchor.constraint(equalToConstant: 90),
            dateLabel.heightAnchor.constraint(equalToConstant: 40)
            ].forEach{ $0.isActive = true }
        
        dateView.addSubview(dateTextField)
        [
            dateTextField.topAnchor.constraint(equalTo: dateView.topAnchor, constant: 10),
            dateTextField.trailingAnchor.constraint(equalTo: dateView.trailingAnchor, constant: -8),
            dateTextField.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor, constant: 8),
            dateTextField.heightAnchor.constraint(equalToConstant: 40)
            ].forEach{ $0.isActive = true }
        
        selectedDateLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 254, height: 40))
        if let selectedLocation = location {
            selectedDateLabel.textColor = UIColor.black
            selectedDateLabel.text = date
        } else {
            selectedDateLabel.text = "When is it?"
            selectedDateLabel.textColor = UIColor.lightGray
        }
        selectedDateLabel.backgroundColor = UIColor.white
        selectedDateLabel.font = UIFont.systemFont(ofSize: 15)
        selectedDateLabel.textAlignment = .left
        //        dateView.addSubview(selectedDateLabel)
        //
        //        selectedDateLabel.translatesAutoresizingMaskIntoConstraints = false
        //        [
        //            selectedDateLabel.topAnchor.constraint(equalTo: dateView.topAnchor, constant: 2),
        //            selectedDateLabel.trailingAnchor.constraint(equalTo: dateView.trailingAnchor, constant: -8),
        //            selectedDateLabel.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor, constant: 12),
        //            selectedDateLabel.heightAnchor.constraint(equalToConstant: 40)
        //            ].forEach{ $0.isActive = true }
        
        view.addSubview(postView)
        [
            postView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            postView.topAnchor.constraint(equalTo: dateView.bottomAnchor),
            postView.heightAnchor.constraint(equalToConstant: 70) // later remove. Just use bottom constraints for nondynamic sizing views
            ].forEach{ $0.isActive = true }
        
        postView.addSubview(postButton)
        [
            postButton.centerXAnchor.constraint(equalTo: postView.centerXAnchor),
            postButton.centerYAnchor.constraint(equalTo: postView.centerYAnchor),
            postButton.heightAnchor.constraint(equalToConstant: 40),
            postButton.widthAnchor.constraint(equalToConstant: 170)
            ].forEach{ $0.isActive = true }
        
    }
}
