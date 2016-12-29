//
//  MasterViewController.swift
//  Blog Reader Demo
//
//  Created by Royce on 24/12/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

import UIKit
import CoreData

class MasterViewController: UITableViewController, NSFetchedResultsControllerDelegate {


    let BlogURL = "https://www.googleapis.com/blogger/v3/blogs/10861780/posts"
    
    
    var detailViewController: DetailViewController? = nil
    var managedObjectContext: NSManagedObjectContext? = nil
    var _fetchedResultsController: NSFetchedResultsController<Event>? = nil
    var frcHelper: FetchedResultControllerHelper<Event>!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("viewDidLoad...")

        loadBlogs()
    }
    
    func loadBlogs() {

        let url = URL(string: "\(BlogURL)?key=\(API_KEY)")!
        
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            
            if let error = error {
                print(error)
                return
            }
            
            guard let urlContent = data else {
                return
            }

            guard let jsonResult = try? JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject, let items = jsonResult["items"] as? NSArray
            else {
                print("JSON Processing Failed")
                return
            }
            
            let context = self.fetchedResultsController.managedObjectContext
            Event.deleteAll(context: context)
            Event.createFrom(array: items as [AnyObject], context: context)
            self.tableView.reloadData()
        }
        task.resume()
    }

    // MARK: - Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
            let object = self.fetchedResultsController.object(at: indexPath)
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.fetchedResultsController.sections?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionInfo = self.fetchedResultsController.sections![section]
        return sectionInfo.numberOfObjects
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let event = self.fetchedResultsController.object(at: indexPath)
        self.configureCell(cell, withEvent: event)
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }

    func configureCell(_ cell: UITableViewCell, withEvent event: Event) {
        cell.textLabel!.text = event.title
    }

    // MARK: - Fetched results controller

    var fetchedResultsController: NSFetchedResultsController<Event> {
        
        guard _fetchedResultsController == nil else {
            return _fetchedResultsController!
        }
        
        frcHelper = FetchedResultControllerHelper(withTable: tableView, configurer: configureCell)
        loadData()
        
        return _fetchedResultsController!
    }
    
    private func loadData() {
        let fetchRequest: NSFetchRequest<Event> = Event.fetchRequest()
        
        fetchRequest.fetchBatchSize = 20
        let sortDescriptor = NSSortDescriptor(key: "published", ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        frcHelper.frc = NSFetchedResultsController(fetchRequest: fetchRequest,
                                                   managedObjectContext: self.managedObjectContext!,
                                                   sectionNameKeyPath: nil,
                                                   cacheName: nil)
        
        frcHelper.frc.delegate = frcHelper
        try? frcHelper.frc.performFetch()
        
        _fetchedResultsController = frcHelper.frc
    }
}
