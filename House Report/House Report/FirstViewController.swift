//
//  FirstViewController.swift
//  House Report
//
//  Created by Royce on 07/08/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

import UIKit
import CoreData


class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    var managedObjectContext: NSManagedObjectContext!
  
    
    var houses: [House] = []
    var isForSale = true
    
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func loadData() {
        let request = NSFetchRequest(entityName: "House")
        request.predicate = NSPredicate(format: "status.isForSale = %@", isForSale)
        
        do {
            houses = try managedObjectContext.executeFetchRequest(request) as! [House]
            tableView.reloadData()
        } catch {
            fatalError("Failed in retrieving list of houses by status!")
        }
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return houses.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("houseCell") as! HouseListTableViewCell
        
        let house = houses[indexPath.row]
        cell.bathLabel.text = String(house.bath)
        cell.bedLabel.text = house.bed?.stringValue
        cell.categoryLabel.text = house.category?.houseType
        cell.cityLabel.text = house.location?.city
        
        let numberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = .CurrencyStyle
        cell.priceLabel.text = numberFormatter.stringFromNumber(house.price!)
        
        let image = UIImage(data: house.image!)
        cell.houseImageView.image = image
        cell.houseImageView.layer.borderWidth = 1
        cell.houseImageView.layer.cornerRadius = 4
        
        return cell
    }
    
    
    @IBAction func segmentedAction(sender: UISegmentedControl) {
        let selectedValue = sender.titleForSegmentAtIndex(sender.selectedSegmentIndex)
        isForSale = selectedValue == "For Rent"
        loadData()
    }

}
