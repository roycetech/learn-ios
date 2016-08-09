//
//  ViewController.swift
//  Night Watch Table
//
//  Created by Royce on 08/08/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    let dailyTasks = [
        "Feed the baby",
        "Give nursery a bath",
        "Serve food to masters",
        "Empty garbage bins",
        "Refill ice containers"
    ]
    
    let weeklyTasks = [
        "Check supply of milk",
        "Check supply of diapers",
        "Do routine checkup"
    ]
    
    let biWeeklyTasks = [
        "See the doctor",
        "Check school report",
        "Have a funtime at outside"
    ]
    
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Daily Tasks"
        case 1:
            return "Weekly Tasks"
        case 2:
            return "Every two weeks tasks"
        default:
            return "This should not be here"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        tableView.backgroundColor = UIColor.clearColor()
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return dailyTasks.count
        case 1:
            return weeklyTasks.count
        case 2:
            return biWeeklyTasks.count
        default:
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var currentTask: String
        switch indexPath.section {
        case 0:
            currentTask = dailyTasks[indexPath.row]
        case 1:
            currentTask =  weeklyTasks[indexPath.row]
        case 2:
            currentTask =  biWeeklyTasks[indexPath.row]
        default:
            currentTask = ""
        }
        
        let cell = UITableViewCell()
        cell.textLabel!.text = currentTask
        cell.backgroundColor = UIColor.clearColor()
        return cell
    }

    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
    }
    
    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.grayColor()
    }
    
    @IBAction func toggleDarkMode(sender: UISwitch) {
        
        if sender.on {
            view.backgroundColor = UIColor.darkGrayColor()
        } else {
            view.backgroundColor = UIColor.whiteColor()
        }
        
    }

}
