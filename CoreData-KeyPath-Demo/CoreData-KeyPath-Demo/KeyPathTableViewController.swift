//
//  KeyPathTableViewController.swift
//  CoreData-KeyPath-Demo
//
//  Created by Royce on 26/10/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

import UIKit
import CoreData


class KeyPathTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {


    var frc: NSFetchedResultsController<Detail>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        createTestData()
        
        let fetchRequest: NSFetchRequest<Detail> = Detail.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "master.name", ascending: true), NSSortDescriptor(key: "name", ascending: true)]
        self.frc = NSFetchedResultsController(
            fetchRequest: fetchRequest,
            managedObjectContext: ad.context(),
            sectionNameKeyPath: "section", cacheName: nil)
        
        self.frc.delegate = self
        do {
            try frc.performFetch()
            tableView.reloadData()
        } catch {
            fatalError("Failed in retrieving list")
        }


    }

    // MARK: - Table view data source

    func createTestData() {
        let master = Master.build()
        master.name = "First Master"
        
        let detail = Detail.build()
        detail.name = "Detail name"
        master.addToDetail(detail)
        
        ad.saveContext()
        
        print("Test Data Created.")
    }
    
    
    // MARK: - Table view data source
    func configureCell(cell: UITableViewCell?, indexPath: NSIndexPath) {
        let location = frc.object(at: indexPath as IndexPath)
        cell?.textLabel?.text = location.name
    }

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        if let sections =  frc.sections {
            return sections.count
        }
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = self.frc.sections {
            let sectionInfo = sections[section]
            return sectionInfo.numberOfObjects
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return frc.sections?[section].name
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let entity = frc.object(at: indexPath)
            entity.delete()
            ad.saveContext()
        }
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - NSFetchedResultsControllerDelegate
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, sectionIndexTitleForSectionName sectionName: String) -> String? {
        return sectionName
    }
    
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        print("\(type)")
        
        if type == NSFetchedResultsChangeType.insert {
            tableView.insertSections(IndexSet(integer: sectionIndex), with: .automatic)
        } else if type == NSFetchedResultsChangeType.delete {
            tableView.deleteSections(IndexSet(integer: sectionIndex), with: .automatic)
        }
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch(type) {
            
        case.insert:
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            break
        case.delete:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            break
        case.update:
            if let indexPath = indexPath {
                let cell = tableView.cellForRow(at: indexPath)
                configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
            }
            break
        case.move:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            break
            
        }
    }
    
    
    func createTestData2() {
        let master = Master.build()
        master.name = "Master 2"
        
        let detail = Detail.build()
        detail.name = "Detail name 2"
        master.addToDetail(detail)
        
        ad.saveContext()
        
        print("Test Data Created.")
    }
    
    @IBAction func actionPressed(_ sender: UIBarButtonItem) {
        print("Pressed")
        
        createTestData2()
        

//        if let master = Master.getBy(name: "First Master") {
//            let detail = Detail.build()
//            detail.name = "Detail name 2"
//            master.addToDetail(detail)
//            ad.saveContext()
//            print("Test Data Created.")
//        } else {
//            print("Test Master not found!")
//        }
    }


}
