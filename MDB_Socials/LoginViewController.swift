//
//  LoginViewController.swift

//  MDB_Socials
//
//  Created by Andrew Santoso on 2/13/19.
//  Copyright © 2019 Andrew Santoso. All rights reserved.
//

import UIKit

import UIKit

// Singleton instance to use for entire application
let firebaseClient = FirebaseAPIClient()

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    var logoImageView: UIImageView!
    
    var usernameTextField : UITextField!
    var passwordTextField : UITextField!
    
    var signInButton : UIButton!
    var signUpButton : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("thisworkd")
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = UIColor(red:0.35, green:0.74, blue:0.98, alpha:1.0)
        
        loginSetUp()
        
        
        
    }
    
    @objc func loginSetUp() {
        
        logoImageView = UIImageView(frame: CGRect(x: 50, y: 170, width: view.frame.width - 100, height: view.frame.height / 6))
        logoImageView.image = UIImage(named: "MDBLOGIN")
        logoImageView.contentMode =  .scaleAspectFit
        view.addSubview(logoImageView)
        
        usernameTextField = UITextField(frame: CGRect(x: 68, y: 350, width: view.frame.width - 140, height: 35))
        usernameTextField.borderStyle = .roundedRect
        usernameTextField.placeholder = "Enter email"
        usernameTextField.keyboardAppearance = .dark
        usernameTextField.keyboardType = .default
        usernameTextField.delegate = self
        usernameTextField.autocorrectionType = .no
        usernameTextField.autocapitalizationType = .none

        view.addSubview(usernameTextField)
        
        passwordTextField = UITextField(frame: CGRect(x: 68, y: 400, width: view.frame.width - 140, height: 35))
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.placeholder = "Enter password"
        passwordTextField.keyboardAppearance = .dark
        passwordTextField.keyboardType = .default
        passwordTextField.delegate = self
        passwordTextField.autocorrectionType = .no
        passwordTextField.autocapitalizationType = .none
        view.addSubview(passwordTextField)
        
        signInButton = UIButton(frame: CGRect(x: 80, y: 460, width: 250, height: 50))
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.setTitleColor(.white, for: .normal)
        signInButton.backgroundColor = UIColor(red:1.00, green:0.80, blue:0.03, alpha:1.0)
        signInButton.layer.cornerRadius = 20
        signInButton.layer.borderWidth = 3
        signInButton.layer.borderColor = UIColor.white.cgColor
        signInButton.addTarget(self, action: #selector(signInClicked), for: .touchUpInside)
        signInButton.titleLabel?.font = UIFont.systemFont(ofSize: 300)
        signInButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        //make button add it to pokemonTraits array
        view.addSubview(signInButton)
        
        signUpButton = UIButton(frame: CGRect(x: 70, y: 515, width: view.frame.width - 140, height: 50))
        signUpButton.setTitle("Don't have an account? Click here!", for: .normal)
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.backgroundColor = UIColor(red:0.35, green:0.74, blue:0.98, alpha:1.0)
        signUpButton.layer.cornerRadius = 20
        signUpButton.addTarget(self, action: #selector(signUpClicked), for: .touchUpInside)
        signUpButton.titleLabel?.font = UIFont.systemFont(ofSize: 300)
        signUpButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        //make button add it to pokemonTraits array
        view.addSubview(signUpButton)
        
    }
    
    func setupViews() {
        
    }
    
    @objc func signInClicked() {
        
        // if either the email or password is empty -> display alert
        if usernameTextField.text == "" || passwordTextField.text == "" {
            alertNoText()
            return
        }
        
        // make sure there is valid text in the textFields
        guard let em = usernameTextField.text, let pass = passwordTextField.text else {
            print("Invalid email or password")
            return
        }
        
        firebaseClient.signInUser(email: em, password: pass) { (success) in
            if success {
                self.performSegue(withIdentifier: "toFeed", sender: self)
            } else {
                self.alertFailedLogin()
            }
        }
    }
    
    func alertNoText() {
        let alertController = UIAlertController(title: "Login Failed", message:
            "Enter valid email and password", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Okay", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func alertFailedLogin() {
        let alertController = UIAlertController(title: "Login Failed", message:
            "Email or Password Incorrect", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Try Again", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    //gets rid of editing when tap outside
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    @objc func signUpClicked() {
        performSegue(withIdentifier: "toSignUp", sender: self)
    }
    
    
    
}

