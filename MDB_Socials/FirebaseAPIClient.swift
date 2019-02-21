//
//  FirebaseAPIClient.swift
//  MDB_Socials
//
//  Created by Andrew Santoso on 2/21/19.
//  Copyright © 2019 Andrew Santoso. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class FirebaseAPIClient {
    
    // NOTE : The methods are buggy. var success does not become true upon successful login/user creation. need better way.
    
    func createUser(email: String, password: String) -> Bool {
        var success = false
        print(email)
        print(password)
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            guard let authResult = authResult, error == nil else {
                print("Error Creating User with error: \(error)")
                return
            }
            print("\(authResult.user.email!) created")
            success = true // never actually sets to true
        }
        print("success is: \(success)")
        return success
    }
    
    func signInUser(email: String, password: String) -> Bool {
        var success: Bool = false
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] user, error in
            if let error = error {
                print("Error Logging in User with error: \(error)")
                return
            }
            success = true
        }
        print("success is: \(success)")
        return success
    }
}


