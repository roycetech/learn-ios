//
//  GroceryTableViewController.swift
//  Grocery
//
//  Created by Royce on 04/08/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

import UIKit
import CoreData

class GroceryTableViewController: UITableViewController {

    
    var groceries = [Grocery]()
    var managedObjectContext: NSManagedObjectContext!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        managedObjectContext = appDelegate.managedObjectContext
    }
  
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        loadData()
    }
    
    func loadData() {
        let request = NSFetchRequest(entityName: "Grocery");
        
        do {
            let results = try managedObjectContext.executeFetchRequest(request)
            groceries = results as! [Grocery]
            tableView.reloadData()
        } catch {
            fatalError("Error in retrieving grocery items!")
        }
    }
  
    @IBAction func addAction(sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Grocery List", message: "Add Item", preferredStyle: UIAlertControllerStyle.Alert)
        
        alertController.addTextFieldWithConfigurationHandler{
            (textField: UITextField) -> Void in
        }
        let addAction = UIAlertAction(title: "Add", style: UIAlertActionStyle.Default) {
            (action) -> Void in
            let textField = alertController.textFields?.first
            
            let grocery = NSEntityDescription.insertNewObjectForEntityForName("Grocery", inManagedObjectContext: self.managedObjectContext) as! Grocery
            grocery.item = textField?.text
            
            do {
                try self.managedObjectContext.save()
            } catch {
                fatalError("Error in saving to Core Data!")
            }
            
            self.loadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default) { (action: UIAlertAction) in
        }
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return groceries.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")
        let grocery = groceries[indexPath.row]
        cell?.textLabel!.text = grocery.item
        
        return cell!
    }


}
