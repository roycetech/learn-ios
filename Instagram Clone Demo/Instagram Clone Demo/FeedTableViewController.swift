//
//  FeedTableViewController.swift
//  Instagram Clone Demo
//
//  Created by Royce on 28/12/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

import UIKit

class FeedTableViewController: UITableViewController {

    
    var parseService: ParseContext!
    
    
    var userIdNameDict: [String: String] = [:]
    var messages: [String] = []
    var usernames: [String] = []
    var imageFiles: [Any] = []
    
    
    func loadPosts() {
        let userIDs = Array(self.userIdNameDict.keys)
        self.parseService.loadPosts(
            userIDs: userIDs,
            callback: {
                (userId, imageFile, message) in
                self.usernames.append(self.userIdNameDict[userId]!)
                if let imageFile = imageFile {
                    self.imageFiles.append(imageFile)
                }
                if let message = message {
                    self.messages.append(message)
                }
            },
            completion: self.tableView.reloadData
        )
    }
    
    func loadUsers() {
        parseService.getFollowedUsers(
            callback: {
                (user) in
                self.userIdNameDict[user.objectId!] = user.username!
            },
            completion: loadPosts
        )
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadUsers()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedTableViewCell
        
        parseService.loadImage(imageData: imageFiles[indexPath.row]) {
            (image) in
            cell.imageViewPosted.image = image
        }
        
        cell.imageViewPosted.image = UIImage(named: "blank-person.png")
        cell.labelUsername.text = usernames[indexPath.row]
        cell.labelMessage.text = messages[indexPath.row]
        return cell
    }

}
