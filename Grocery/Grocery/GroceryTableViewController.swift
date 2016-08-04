//
//  GroceryTableViewController.swift
//  Grocery
//
//  Created by Royce on 04/08/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

import UIKit

class GroceryTableViewController: UITableViewController {

    
  var groceries = [String]()
  
    override func viewDidLoad() {
        super.viewDidLoad()
    }
  
  
    @IBAction func addAction(sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Grocery List", message: "Add Item", preferredStyle: UIAlertControllerStyle.Alert)
        
        alertController.addTextFieldWithConfigurationHandler{
            (textField: UITextField) -> Void in
        }
        let addAction = UIAlertAction(title: "Add", style: UIAlertActionStyle.Default) {
            (action) -> Void in
            let textField = alertController.textFields?.first
            self.groceries.append(textField!.text!)
            self.tableView.reloadData()
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
        cell?.textLabel?.text = groceries[indexPath.row]
        return cell!
    }


}
