//
//  ViewController.swift
//  Night Watch Table
//
//  Created by Royce on 08/08/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    
    
    var dailyTasks = [
        Task(name: "Check Email", type: .Daily, done: true, lastDone: nil),
        Task(name: "Give nursery a bath", type: .Daily, done: false, lastDone: nil),
        Task(name: "Clean playroom", type: .Daily, done: false, lastDone: nil),
        Task(name: "Empty garbage bins", type: .Daily, done: false, lastDone: nil),
        Task(name: "Refill ice containers", type: .Daily, done: false, lastDone: nil)
    ]
    
    var weeklyTasks = [
        Task(name: "Check supply of milk", type: .Daily, done: false, lastDone: nil),
        Task(name: "Check supply of diapers", type: .Daily, done: false, lastDone: nil),
        Task(name: "Do routine checkup", type: .Daily, done: false, lastDone: nil)
    ]
    
    var biWeeklyTasks = [
        Task(name: "See the doctor", type: .Daily, done: false, lastDone: nil),
        Task(name: "Check school report", type: .Daily, done: false, lastDone: nil),
        Task(name: "Have a funtime at outside", type: .Daily, done: false, lastDone: nil)
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        tableView.backgroundColor = UIColor.clearColor()
        return 3
    }
    
    func getTask(index: Int) -> [Task] {
        switch index {
        case 0:
            return dailyTasks
        case 1:
            return weeklyTasks
        case 2:
            return biWeeklyTasks
        default:
            fatalError("System Error")
        }
    }
    
    /** 
     Use this to modify the instance array.
     */
    func getTaskReference(index: Int, f:(inout [Task]) -> Void) {
        switch index {
        case 0:
            return f(&dailyTasks)
        case 1:
            return f(&weeklyTasks)
        case 2:
            return f(&biWeeklyTasks)
        default:
            fatalError("System Error")
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getTask(section).count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
    
        let currentTask = getTask(indexPath.section)[indexPath.row]
        let cell = UITableViewCell()
        cell.textLabel!.text = currentTask.name
        
        if currentTask.done {
            cell.textLabel?.textColor = UIColor.lightGrayColor()
            cell.accessoryType = .Checkmark
        } else {
            cell.textLabel?.textColor = UIColor.blackColor()
            cell.accessoryType = .None
        }
        
        cell.backgroundColor = UIColor.clearColor()
        return cell
    }

    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        let action = UITableViewRowAction(style: .Default, title: "Done") { (action, indexPath) in
            var task = self.getTask(indexPath.section)[indexPath.row]
            task.done = true
            
            self.getTaskReference(indexPath.section) {
                (inout picked: [Task]) in
                picked[indexPath.row].done = true
            }
            
            tableView.reloadData()
            tableView.editing = false
        }
        return [action]
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
    
    @IBAction func resetList(sender: UIBarButtonItem) {
        
        for i in 0..<dailyTasks.count {
            dailyTasks[i].done = false
        }
    
        for i in 0..<weeklyTasks.count {
            weeklyTasks[i].done = false
        }
        
        for i in 0..<biWeeklyTasks.count {
            biWeeklyTasks[i].done = false
        }
        
        tableView.reloadData()
        
    }
    

}
