//
//  FetchedResultControllerHelper.swift
//  Blog Reader Demo
//
//  Created by Royce on 25/12/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

import Foundation
import UIKit
import CoreData


class FetchedResultControllerHelper<T: NSManagedObject>: NSObject, NSFetchedResultsControllerDelegate {
    
    
    let tableView: UITableView
    var frc: NSFetchedResultsController<T>!
    let configurer: (UITableViewCell, Event) -> Void
    
    
    init(withTable tableView: UITableView, configurer: @escaping (UITableViewCell, Event) -> Void) {
        self.tableView = tableView
        self.configurer = configurer
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.tableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        switch type {
        case .insert:
            self.tableView.insertSections(IndexSet(integer: sectionIndex), with: .fade)
        case .delete:
            self.tableView.deleteSections(IndexSet(integer: sectionIndex), with: .fade)
        default:
            return
        }
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            tableView.insertRows(at: [newIndexPath!], with: .fade)
        case .delete:
            tableView.deleteRows(at: [indexPath!], with: .fade)
        case .update:
            configurer(tableView.cellForRow(at: indexPath!)!, anObject as! Event)
        case .move:
            tableView.moveRow(at: indexPath!, to: newIndexPath!)
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.tableView.endUpdates()
    }
    
}
