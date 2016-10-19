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
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "House")
        
        request.predicate = NSPredicate(format: "status.isForSale = %@", isForSale as CVarArg)
        
        do {
            houses = try managedObjectContext.fetch(request) as! [House]
            tableView.reloadData()
        } catch {
            fatalError("Failed in retrieving list of houses by status!")
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return houses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "houseCell") as! HouseListTableViewCell
        
        let house = houses[(indexPath as NSIndexPath).row]
        cell.bathLabel.text = String(describing: house.bath)
        cell.bedLabel.text = house.bed?.stringValue
        cell.categoryLabel.text = house.category?.houseType
        cell.cityLabel.text = house.location?.city
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        cell.priceLabel.text = numberFormatter.string(from: house.price!)
        
        let image = UIImage(data: house.image! as Data)
        cell.houseImageView.image = image
        cell.houseImageView.layer.borderWidth = 1
        cell.houseImageView.layer.cornerRadius = 4
        
        return cell
    }
    
    
    @IBAction func segmentedAction(_ sender: UISegmentedControl) {
        let selectedValue = sender.titleForSegment(at: sender.selectedSegmentIndex)
        isForSale = selectedValue == "For Rent"
        loadData()
    }

}
