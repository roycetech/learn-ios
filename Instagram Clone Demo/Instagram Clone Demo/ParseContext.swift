//
//  ParseContext.swift
//  Instagram Clone Demo
//
//  Created by Royce on 26/12/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

import Parse


class ParseContext {
    
    
    func getCurrentUser() -> PFUser? {
        return PFUser.current()
    }
    
    func isUserLoggedIn() -> Bool {
        if let currentUser = getCurrentUser(), currentUser.objectId != nil {
            return true
        }
        return false
    }
    
    func logOut() {
        PFUser.logOut()
    }
    
    func save(object: PFObject) {
        object.saveInBackground { (success, error) in
            if success {
                print("Saved")
            } else if let error = error {
                print(error)
            }
        }
    }
    
    
    func signUp(email: String, password: String,
                precomplete: ((Bool, Error?) -> Void)? = nil,
                onerror: ((String) -> Void)? = nil,
                onsuccess: (() -> Void)? = nil) {
        
        let user = PFUser()
        user.username = email
        user.email = email
        user.password = password
        user.signUpInBackground(block: { (success, error) in

            precomplete?(success, error)
            if let error = error as? NSError {
                var displayErrorMessage = "Please try again later."
                if let errorMessage = error.userInfo["error"] as? String {
                    displayErrorMessage = errorMessage
                }
                onerror?(displayErrorMessage)
            } else {
                print("User [\(email)] signed up")
                onsuccess?()
            }
        })
    }

    func login(email: String, password: String,
               precomplete: ((AnyObject?, Error?) -> Void)? = nil,
               onerror: ((String) -> Void)? = nil,
               onsuccess: (() -> Void)? = nil) {
        
        PFUser.logInWithUsername(inBackground: email, password: password) {
            (user, error) in
            
            precomplete?(user, error)
            if let error = error {
                var displayErrorMessage = "Please try again later."
                let error = error as NSError?
                if let errorMessage = error?.userInfo["error"] as? String {
                    displayErrorMessage = errorMessage
                }
                onerror?(displayErrorMessage)
            } else {
                onsuccess?()
            }
        }
    }
    
    func unfollow(following: String) {
        guard
            let currentUser = getCurrentUser(),
            let follower = currentUser.objectId else {
                return
        }
            
        let query = PFQuery(className: "Followers")
        query.whereKey("follower", equalTo: follower)
        query.whereKey("following", equalTo: following)
        
        query.findObjectsInBackground(block: { (objects, error) in
            guard let objects = objects else { return }
            
            for object in objects {
                object.deleteInBackground()
            }
        })
    }
    
    func follow(user following: String) {
        let newFollower = PFObject(className: "Followers")
        if let currentUser = getCurrentUser() {
            newFollower["follower"] = currentUser.objectId
            newFollower["following"] = following
            newFollower.saveInBackground()
        }
    }
    
    func getFollowedUsers(callback: @escaping (PFUser) -> Void,
                          completion: @escaping () -> Void) {
        let query = PFUser.query()
        query?.findObjectsInBackground {
            (objects, error) in
            if let users = objects as? [PFUser] {
                for user in users  {
                    callback(user)
                }
                completion()
            }
        }
    }
    
    func getOtherUsers(
        callback: @escaping (PFUser) -> Void,
        oncomplete: (() -> Void)? = nil) {
        
        guard
            let currentUser = getCurrentUser(),
            let currentEmail = currentUser.email,
            let query = PFUser.query()
        else { return }
            
        query.whereKey("username", notEqualTo: currentEmail)
        query.findObjectsInBackground(block: { (objects, error) in
            if error == nil, let users = objects as? [PFUser] {
                for user in users {
                    callback(user)
                }
                oncomplete?()
            }
        })
    }
    
    func checkFollowing(toId : String, callback: @escaping (Bool) -> Void) {
        if let currentUser = getCurrentUser(), let currentUserId = currentUser.objectId {
            let query = PFQuery(className: "Followers")
            query.whereKey("follower", equalTo: currentUserId)
            query.whereKey("following", equalTo: toId)
            query.findObjectsInBackground(block: { (objects, error) in
                if let objects = objects {
                    callback(objects.count > 0)
                }
            })
        }
    }
    
    func loadPosts(userIDs: [String],
                   callback: @escaping (String, PFFile?, String?) -> Void,
                   completion: @escaping () -> Void) {
        
        let predicate = NSPredicate(format: "userid in %@", userIDs)
        let query = PFQuery(className: "Posts", predicate: predicate)

        query.findObjectsInBackground {
            (posts, error) in
            
            guard let posts = posts else { return }

            for post in posts  {
                callback(post["userid"] as! String,
                         post["imageFile"] as? PFFile,
                         post["message"] as? String)
            }
            completion()
        }
    }
    
    func postImage(image: UIImage, message: String? = nil,
                   onerror: ((Error) -> Void)? = nil,
                   onsuccess: (() -> Void)? = nil,
                   oncomplete: (() -> Void)? = nil) {
        
        guard let currentUser = getCurrentUser(),
            let userId = currentUser.objectId else { return }
        
        let post = PFObject(className: "Posts")
        post["message"] = message
        post["userid"] = userId
        let imageData = UIImagePNGRepresentation(image)
        
        let imageFile = PFFile(name: "image.png", data: imageData!)
        post["imageFile"] = imageFile
        
        post.saveInBackground { (success, error) in
            if let error = error {
                onerror?(error)
            } else if success {
                onsuccess?()
            }
            oncomplete?()
        }
    }
    
    func loadImage(imageData: Any?, callback: @escaping (UIImage) -> Void) {
        
        guard let file = imageData as? PFFile else { return }
        
        file.getDataInBackground(block: { (data, error) in
            
            guard let imageData = data else { return }
            
            if let downloadedImage = UIImage(data: imageData) {
                callback(downloadedImage)
            }
        })
    }
}


