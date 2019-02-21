//
//  FeedViewController.swift
//  MDB_Socials
//
//  Created by Andrew Santoso on 2/21/19.
//  Copyright © 2019 Andrew Santoso. All rights reserved.
//

import Foundation
import UIKit

class FeedViewController: UIViewController {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 220)
        let collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.register(EventCell.self, forCellWithReuseIdentifier: "eventCell")
        collectionView.backgroundColor = .white
        collectionView.bounces = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    @objc func addTapped() {
        performSegue(withIdentifier: "showNew", sender: self)
    }
}
