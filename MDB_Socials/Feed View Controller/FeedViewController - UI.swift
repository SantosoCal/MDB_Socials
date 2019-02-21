//
//  FeedViewController - UI.swift
//  MDB_Socials
//
//  Created by Andrew Santoso on 2/21/19.
//  Copyright © 2019 Andrew Santoso. All rights reserved.
//

import Foundation
import UIKit

extension FeedViewController {
    
    func setupViews() {
        
        setupNavBar()
        
        view.addSubview(collectionView)
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
    func setupNavBar() {
        
        let navController = navigationController!
        self.title = "Event Feed"
        
        let rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        navController.navigationBar.tintColor = Constants.lightBlue
        
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.font: UIFont(name: "AppleSDGothicNeo-Bold", size: 18)!]
    }
}
