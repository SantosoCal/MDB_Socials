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
import FirebaseDatabase
import FirebaseStorage

class FirebaseAPIClient {
    
    // NOTE : The methods are buggy. var success does not become true upon successful login/user creation. need better way.
    
    func createUser(email: String, password: String, completion: @escaping (Bool) -> Void) {
        print(email)
        print(password)
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            guard let authResult = authResult, error == nil else {
                print("Error Creating User with error: \(error)")
                completion(false)
                return
            }
            print("\(authResult.user.email!) created")
            completion(true)
        }
    }
    
    func signInUser(email: String, password: String, completion: @escaping (Bool) -> Void ){
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] user, error in
            if let error = error {
                print("Error Logging in User with error: \(error)")
                completion(false)
                return
            }
            completion(true)
        }
    }
    
    func getAllEvents(completion: @escaping ([Event]?) -> Void) {
        let dbRef = Database.database().reference()
        dbRef.child("Events").observeSingleEvent(of: .value, with: { (snapshot) in
            var events: [Event] = []
            
            for child in snapshot.children {
                let eventDic = (child as! DataSnapshot).value as! NSDictionary
                print(eventDic)
                let description = eventDic.value(forKey: "eventDescription") as! String
                let name = eventDic.value(forKey: "eventName") as! String
                //let users = eventDic.value(forKey: "eventUsers") as! [String : String]
                let date = eventDic.value(forKey: "eventDate") as! String
//
//                let event = Event(name: name, description: description, date: date, users: users)
                let event = Event(name: name, description: description, date: date)
                events.append(event)
            }
            completion(events)
//            print(events[0].name)
//            print(events[0].description)
//            print(events[0].date)
//            print(events[0].users)
        })
    }
    
    func getEventImage(name: String, completion: @escaping (UIImage?) -> Void) {
        
        // Get a reference to the storage service using the default Firebase App
        let storage = Storage.storage()
        
        let pathReference = storage.reference(withPath: "events/\(name).jpg")
        
        // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
        pathReference.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if let error = error {
                // Uh-oh, an error occurred!
                completion(nil)
            } else {
                // Data for "images/island.jpg" is returned
                let image = UIImage(data: data!)
                completion(image)
            }
        }

    }
    
    func addNewSocial(event: Event, completion: @escaping ((Bool)  -> Void)) {
        let dbRef = Database.database().reference()
        let newChild = dbRef.child("Events").childByAutoId()
        event.id = newChild.key!
        
        newChild.updateChildValues(event.toDict()) { (error, ref) in
            if let error = error {
                print(error.localizedDescription)
                completion(false)
                return
            }
            completion(true)
        }
    }
    
    func uploadImage(image: UIImage, name: String, completion: @escaping (Bool) -> Void) {
        let storageRef = Storage.storage().reference().child("events").child("\(name).jpg")
        if let uploadData = image.jpegData(compressionQuality: 1.0) {
            
            storageRef.putData(uploadData, metadata: nil, completion: { (_, err) in
                
                if let error = err {
                    print(error)
                    completion(false)
                    return
                }
                completion(true)
            })
        }
    }
    

}


