//
//  ShowPhoto.swift
//  MDB_Socials
//
//  Created by Andrew Santoso on 2/20/19.
//  Copyright © 2019 Andrew Santoso. All rights reserved.
//

import UIKit

class ShowPhoto: UIViewController {

    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var image: UIImage? {
        didSet {
            if let im = image {
                self.imageView.image = image
            }
        }
    }
    
    lazy var doneButton: UIButton = {
        let doneButton = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 50))
        doneButton.layer.masksToBounds = true
        doneButton.layer.cornerRadius = 10
        doneButton.backgroundColor = Constants.correctGreen
        doneButton.setTitle("Done", for: .normal)
        doneButton.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 18)
        doneButton.titleLabel?.textColor = .white
        doneButton.addTarget(self, action: #selector(savePhoto), for: .touchUpInside)
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        return doneButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }
    
    private func setupViews() {
        
        self.title = "Preview"
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(dismissSelf))
        
        view.addSubview(imageView)
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        view.addSubview(doneButton)
        doneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        doneButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        doneButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        doneButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 40).isActive = true
        
    }
    
    @objc private func dismissSelf() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func savePhoto() {
        performSegue(withIdentifier: "unwindToNew", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "unwindToNew" {
            if let destinationVC = segue.destination as? NewSocialViewController {
                if let im = self.image {
                    destinationVC.imageView.image = im
                }
            }
        }
    }

}
