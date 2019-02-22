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
    
    var events: [Event]? {
        didSet{
            if let evs = events {
                for event in evs {
                    print("\(event.name)")
                }
            }
            collectionView.reloadData()
        }
    }
    
    var imageToPass: UIImage?
    
    var eventToPass: Event? {
        didSet {
            if let ev = eventToPass {
                performSegue(withIdentifier: "showEvent", sender: self)
            }
        }
    }
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getEvents()
        eventToPass = nil
    }
    
    private func getEvents() {
        firebaseClient.getAllEvents { (events) in
            if let events = events {
                self.events = events
            }
        }
    }
    
    func updateUI() {
        getEvents()
    }
    
    @objc func addTapped() {
        performSegue(withIdentifier: "showNew", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showNew" {
            
        } else if segue.identifier == "showEvent" {
            if let viewController = segue.destination as? DetailViewController {
                viewController.image = self.imageToPass
                viewController.event = self.eventToPass
            }
        }
    }
}
