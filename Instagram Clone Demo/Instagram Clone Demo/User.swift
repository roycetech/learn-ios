//
//  User.swift
//  Instagram Clone Demo
//
//  Created by Royce on 26/12/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

import Foundation
import Parse


class User {
    
    
    static let CLASS_NAME = "Users"
    
    
    public static func create(name: String) {
        let newUser = PFObject(className: CLASS_NAME)
        
        newUser["name"] = name
        newUser.saveInBackground { (success, error) -> Void in
            if success {
                print("User has been saved.")
            } else {
                if let error = error {
                    print(error)
                }
            }
        }
    }
    
//    public static func get(withId id: String) {
//        
//        
//        let query = PFQuery(className: CLASS_NAME)
//        query.getObjectInBackground(withId: id) { (object, error) in
//            if let error = error {
//                print("Error retrieving User with ID: \(id), \(error)")
//            } else {
//                if let user = object {
//                    print(user)
//                    print(user["name"])
//                }
//            }
//        }
//        
//    }

    public static func get(withId id: String, callback: @escaping (PFObject?) -> Void) {
        let query = PFQuery(className: CLASS_NAME)
        query.getObjectInBackground(withId: id) { (object, error) in
            if let error = error {
                print("Error retrieving User with ID: \(id), \(error)")
            } else {
                callback(object)
            }
        }
    }

    
}
