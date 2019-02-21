//
//  SignUpViewController.swift
//  MDB_Socials
//
//  Created by Sam Lee on 2/20/19.
//  Copyright © 2019 Andrew Santoso. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    var nameSignUpTextField : UITextField!
    var usernameSignUpTextField : UITextField!
    var passSignUpTextField : UITextField!
    var emailSignUpTextField : UITextField!
    
    var welcomeLabel : UILabel!
    
    var doneSignUpButton : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpSignIn()
        
        view.backgroundColor =  UIColor(red:1.00, green:0.80, blue:0.03, alpha:1.0)

        // Do any additional setup after loading the view.
    }
    
    @objc func setUpSignIn() {
        
        welcomeLabel = UILabel(frame: CGRect(x: 68, y: 280, width: view.frame.width - 140, height: 60))
        welcomeLabel.text = "WELCOME"
        welcomeLabel.textColor = .white
        welcomeLabel.textAlignment = NSTextAlignment.center
        welcomeLabel.font = UIFont.boldSystemFont(ofSize: 55)
        view.addSubview(welcomeLabel)
            
            
        nameSignUpTextField = UITextField(frame: CGRect(x: 68, y: 380, width: view.frame.width - 140, height: 35))
        nameSignUpTextField.borderStyle = .roundedRect
        nameSignUpTextField.placeholder = "Enter full name"
        nameSignUpTextField.keyboardAppearance = .dark
        nameSignUpTextField.keyboardType = .default
        nameSignUpTextField.textAlignment = .center
        nameSignUpTextField.delegate = self
        view.addSubview(nameSignUpTextField)
        
        usernameSignUpTextField = UITextField(frame: CGRect(x: 68, y: 430, width: view.frame.width - 140, height: 35))
        usernameSignUpTextField.borderStyle = .roundedRect
        usernameSignUpTextField.placeholder = "Enter password"
        usernameSignUpTextField.keyboardAppearance = .dark
        usernameSignUpTextField.keyboardType = .default
        usernameSignUpTextField.textAlignment = .center
        usernameSignUpTextField.autocapitalizationType = .none
        usernameSignUpTextField.autocorrectionType = .no
        usernameSignUpTextField.delegate = self
        view.addSubview(usernameSignUpTextField)
        
        passSignUpTextField = UITextField(frame: CGRect(x: 68, y: 480, width: view.frame.width - 140, height: 35))
        passSignUpTextField.borderStyle = .roundedRect
        passSignUpTextField.placeholder = "Enter password"
        passSignUpTextField.keyboardAppearance = .dark
        passSignUpTextField.keyboardType = .default
        passSignUpTextField.textAlignment = .center
        passSignUpTextField.autocapitalizationType = .none
        passSignUpTextField.autocorrectionType = .no
        passSignUpTextField.delegate = self
        view.addSubview(passSignUpTextField)
        
        emailSignUpTextField = UITextField(frame: CGRect(x: 68, y: 530, width: view.frame.width - 140, height: 35))
        emailSignUpTextField.borderStyle = .roundedRect
        emailSignUpTextField.placeholder = "Enter email"
        emailSignUpTextField.keyboardAppearance = .dark
        emailSignUpTextField.keyboardType = .default
        emailSignUpTextField.textAlignment = .center
        emailSignUpTextField.autocapitalizationType = .none
        emailSignUpTextField.autocorrectionType = .no
        emailSignUpTextField.delegate = self
        view.addSubview(emailSignUpTextField)
        
        doneSignUpButton = UIButton(frame: CGRect(x: 68, y: 605, width: view.frame.width - 140, height: 50))
        doneSignUpButton.setTitle("Done!", for: .normal)
        doneSignUpButton.setTitleColor( UIColor(red:1.00, green:0.80, blue:0.03, alpha:1.0), for: .normal)
        doneSignUpButton.backgroundColor = .white
        doneSignUpButton.layer.cornerRadius = 20
        doneSignUpButton.addTarget(self, action: #selector(doneClicked), for: .touchUpInside)
        doneSignUpButton.titleLabel?.font = UIFont.systemFont(ofSize: 300)
        doneSignUpButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        //make button add it to pokemonTraits array
        view.addSubview(doneSignUpButton)
        
    }
    
    func displayAlert(type: Alert) {
        switch type {
        case .sixCharacters:
            let alertController = UIAlertController(title: "Failed Creating User", message:
                "Password needs to be at least six characters", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Try Again", style: .default))
            self.present(alertController, animated: true, completion: nil)
        case .noText:
            let alertController = UIAlertController(title: "Login Failed", message:
                "Missing Information", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Try Again", style: .default))
            self.present(alertController, animated: true, completion: nil)
        case .wrongInfo:
            let alertController = UIAlertController(title: "Creating User Failed", message:
                "Wrong Username or Password", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Try Again", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    //gets rid of editing when tap outside
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    @objc func doneClicked() {
        
        // if any of the fields don't have text then present alert
        if nameSignUpTextField.text == "" || usernameSignUpTextField.text == "" || passSignUpTextField.text == "" || emailSignUpTextField.text == "" {
            displayAlert(type: .noText)
            return
        }
        
        // make sure there is valid text in the textFields
        guard let em = emailSignUpTextField.text, let pass = passSignUpTextField.text else {
            displayAlert(type: .noText)
            return
        }
        
        if pass.count < 6 {
            displayAlert(type: .sixCharacters)
        }
        
        if firebaseClient.createUser(email: em, password: pass) {
            print("created user successfully")
            performSegue(withIdentifier: "toFeed", sender: self)
        } else {
            displayAlert(type: .wrongInfo)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
