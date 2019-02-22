//
//  Event.swift
//  MDB_Socials
//
//  Created by Andrew Santoso on 2/21/19.
//  Copyright © 2019 Andrew Santoso. All rights reserved.
//

import Foundation

class Event {
    
    var id: String
    var name: String
    var description: String
    var date: String
    //var users: [String : String]
    
//    init(name: String, description: String, date: String, users: [String : String]) {
//        self.id = UUID().uuidString
//        self.name = name
//        self.description = description
//        self.date = date
//        self.users = users
//    }
    init(name: String, description: String, date: String) {
        self.id = UUID().uuidString
        self.name = name
        self.description = description
        self.date = date
        //self.users = users
    }
    //
    func toDict() -> [AnyHashable: Any] {
//        return ["eventName": name, "eventDescription": description, "eventDate": date, "eventUsers": [users]]
        return ["eventName": name, "eventDescription": description, "eventDate": date]
    }
    
}
