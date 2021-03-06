//
//  NewSocialViewController.swift
//  MDB_Socials
//
//  Created by Andrew Santoso on 2/20/19.
//  Copyright © 2019 Andrew Santoso. All rights reserved.
//

import UIKit

class NewSocialViewController: UIViewController {
    
    var photo: UIImage?
    var location: String?
    
    var date: String?
    
    var name: String?
    
    var selectedNameLabel: UILabel!
    var selectedDateLabel: UILabel!
    
    lazy var imageContainerView: UIView = {
        let imageContainerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 150))
        imageContainerView.translatesAutoresizingMaskIntoConstraints = false
        return imageContainerView
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: imageContainerView.frame.height))
//        imageView.image = UIImage(named: "Family.jpg")
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    lazy var descriptionView: UIView = {
        let descriptionView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 70))
        descriptionView.layer.borderWidth = 1
        descriptionView.layer.borderColor = UIColor(red:220/255, green:220/255, blue:220/255, alpha: 1).cgColor
        return descriptionView
    }()
    
    lazy var descriptionLabel: CategoryLabel = {
        let descriptionLabel = CategoryLabel(frame: CGRect(x: 0, y: 0, width: 90, height: 40))
        descriptionLabel.text = "Caption"
        return descriptionLabel
    }()
    
    lazy var descriptionTextView: UITextView = {
        let descriptionTextView = UITextView(frame: CGRect(x: 0, y: 0, width: 254, height: 80))
        descriptionTextView.delegate = self
        descriptionTextView.isScrollEnabled = false
        descriptionTextView.font = UIFont.systemFont(ofSize: 15)
        descriptionTextView.text = placeholderText
        descriptionTextView.textColor = UIColor.lightGray
        return descriptionTextView
    }()
    
    lazy var nameView: UIView = {
        let nameView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 70))
        return nameView
    }()
    
    lazy var nameLabel: CategoryLabel = {
        let nameLabel = CategoryLabel(frame: CGRect(x: 0, y: 0, width: 90, height: 40))
        nameLabel.text = "Name"
        return nameLabel
    }()
    
    lazy var nameTextField: UITextField = {
        let nameTextField = UITextField(frame: CGRect(x: 0, y: 0, width: 254, height: 80))
        nameTextField.placeholder = "What was the name of this event?"
        nameTextField.font = UIFont.systemFont(ofSize: 15)
        nameTextField.keyboardType = UIKeyboardType.default
        nameTextField.returnKeyType = UIReturnKeyType.done
        nameTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        nameTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        nameTextField.delegate = self
        return nameTextField
    }()
    
    lazy var dateView: UIView = {
        let dateView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 70))
        dateView.layer.borderWidth = 1
        dateView.layer.borderColor = UIColor(red:220/255, green:220/255, blue:220/255, alpha: 1).cgColor
        dateView.translatesAutoresizingMaskIntoConstraints = false
        return dateView
    }()
    
    lazy var dateLabel: CategoryLabel = {
        let dateLabel = CategoryLabel(frame: CGRect(x: 0, y: 0, width: 90, height: 40))
        dateLabel.text = "Date"
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        return dateLabel
    }()
    
    lazy var dateTextField: UITextField = {
        let dateTextField = UITextField(frame: CGRect(x: 0, y: 0, width: 254, height: 40))
        dateTextField.placeholder = "When is the event?"
        dateTextField.font = UIFont.systemFont(ofSize: 15)
        dateTextField.keyboardType = UIKeyboardType.default
        dateTextField.returnKeyType = UIReturnKeyType.done
        dateTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        dateTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        dateTextField.delegate = self
        dateTextField.translatesAutoresizingMaskIntoConstraints = false
        return dateTextField
    }()
    
    lazy var postView: UIView = {
        let postView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 100))
        postView.translatesAutoresizingMaskIntoConstraints = false
        return postView
    }()
    
    lazy var postButton: UIButton = {
        let frame = CGRect(x: 0, y: 0, width: 170, height: 40)
        let postButton = UIButton(frame: frame)
        postButton.backgroundColor = Constants.coolGreen
        postButton.setTitle("Post", for: .normal)
        postButton.titleLabel?.textColor = .white
        postButton.addTarget(self, action: #selector(postButtonClicked), for: .touchUpInside)
        postButton.layer.masksToBounds = true
        postButton.layer.cornerRadius = postButton.frame.height / 2
        postButton.isUserInteractionEnabled = true
        postButton.translatesAutoresizingMaskIntoConstraints = false
        return postButton
    }()
    
    let placeholderText = "Add a description..."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        setUpViews()
    }
    
    @objc func presentCameraView() {
        performSegue(withIdentifier: "showCamera", sender: self)
    }
    
    //gets rid of editing when tap outside
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    @objc func postButtonClicked() {
        
        if imageView.image == nil {
            displayAlertImage()
        }
        
        name = nameTextField.text
        let description = descriptionTextView.text
        let date = dateTextField.text
        //let users = [String: String]()
        
//        let event: Event = Event(name: name!, description: description!, date: date!, users: users)
        let event: Event = Event(name: name!, description: description!, date: date!)
        
        firebaseClient.addNewSocial(event: event) { (success) in
            if success {
                if let im = self.imageView.image {
                    firebaseClient.uploadImage(image: im, name: self.name!, completion: { (success) in
                        if success {
                            self.dismiss(animated: true, completion: nil)
                        } else {
                            print("Failed uploading image")
                            self.displayAlert()
                        }
                    })
                }
                self.dismiss(animated: true, completion: nil)
            } else {
                self.displayAlert()
            }
        }
    }
    
    @objc func cancelButtonPressed() {
        dismiss(animated: true, completion: nil)
        print("cancelButtonPressed")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCamera" {
            print("showing Camera")
        }
    }
    
    @IBAction func unwindToNewSocialVC(segue: UIStoryboardSegue) {
        
    }
    
    func displayAlert() {
        let alertController = UIAlertController(title: "Failed Post", message:
            "You should try again", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Try Again", style: .default))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func displayAlertImage() {
        let alertController = UIAlertController(title: "Failed Post", message:
            "Event needs an image", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Try Again", style: .default))
        self.present(alertController, animated: true, completion: nil)
    }
    
}
