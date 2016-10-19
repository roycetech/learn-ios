//
//  CoreData.swift
//  House Report
//
//  Created by Royce on 07/08/2016.
//  Copyright © 2016 Ryetech. All rights rese                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     rved.
//

import Foundation
import CoreData

class CoreData {
 
    let model = "House Report"
    
    fileprivate lazy var applicationDocumentsDirectory: URL = {
        let urls  = FileManager.default.urls(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask)
        return urls[urls.count-1]
    }()
    
    fileprivate lazy var managedObjectModel: NSManagedObjectModel = {
        let modelURL = Bundle.main.url(forResource: self.model, withExtension: "momd")!
        return NSManagedObjectModel(contentsOf: modelURL)!
    }()
    
    fileprivate lazy var persistenceStoreCoordinator: NSPersistentStoreCoordinator = {
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.appendingPathComponent(self.model)
        
        do {
            let options = [NSMigratePersistentStoresAutomaticallyOption: true]
            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: options)
        } catch {
            fatalError("Error adding persistence store")
        }
        return coordinator
    }()

    lazy var managedObjectContext: NSManagedObjectContext = {
        var context = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.mainQueueConcurrencyType)
        context.persistentStoreCoordinator = self.persistenceStoreCoordinator
        return context
    }()
    
    func saveContext() {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                fatalError("Error saving context")
            }
        }
    }
    
}
