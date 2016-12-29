//
//  UserTableViewController.swift
//  Instagram Clone Demo
//
//  Created by Royce on 27/12/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

import UIKit

class UserTableViewController: UITableViewController {

    
    var usernames:[String] = []
    var userIDs:[String] = []
    var isFollowing:[String:Bool] = [:]
    
    
    var refresher: UIRefreshControl!
    
    
    var parseContext: ParseContext!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refresh()
        refresher = UIRefreshControl()
        
        refresher.attributedTitle = NSAttributedString(string: "Pull to refresh")
        
        refresher.addTarget(
            self,
            action: #selector(UserTableViewController.refresh),
            for: UIControlEvents.valueChanged)
        
        tableView.addSubview(refresher)
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }

    @IBAction func logout(_ sender: AnyObject) {
        parseContext.logOut()
        performSegue(withIdentifier: "logoutSegue", sender: self)
    }
    
    /** Users other than self. */
    func loadOtherUsers() {
        parseContext.getOtherUsers(
            callback: {
                (user) in
                let usernameArray = user.username!.components(separatedBy: "@")
                let username = usernameArray[0]
                self.usernames.append(username)
                
                if let objectId = user.objectId {
                    self.userIDs.append(objectId)
                }
            }, oncomplete: self.tickFollowings
        )
    }
    
    func tickFollowings() {
        for userId in userIDs {
            parseContext.checkFollowing(toId: userId) {
                (isFollowing) in
                self.isFollowing[userId] = isFollowing
            }
        }
        self.tableView.reloadData()
        self.refresher.endRefreshing()
    }
    
    func refresh() {
        loadOtherUsers()
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usernames.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = usernames[indexPath.row]
        if isFollowing[userIDs[indexPath.row]]! {
            cell.accessoryType = UITableViewCellAccessoryType.checkmark
        }
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)
        let tappedUser = userIDs[indexPath.row]
        
        if isFollowing[userIDs[indexPath.row]]! {
            unfollow(userId: tappedUser, cell: cell)
        } else {
            follow(userId: tappedUser, cell: cell)
        }
    }
    
    func unfollow(userId: String, cell: UITableViewCell?) {
        isFollowing[userId] = false
        cell?.accessoryType = UITableViewCellAccessoryType.none
        parseContext.unfollow(following: userId)
    }
    
    func follow(userId: String, cell: UITableViewCell?) {
        isFollowing[userId] = true
        cell?.accessoryType = UITableViewCellAccessoryType.checkmark
        parseContext.follow(user: userId)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "logoutSegue",
            let destVC = segue.destination as? ViewController {
            destVC.parseContext = self.parseContext
        } else if let destVC = segue.destination as? PostViewController {
            destVC.parseService = self.parseContext
        } else if let destVC = segue.destination as? FeedTableViewController {
            destVC.parseService = self.parseContext
        }
    }
    
}
