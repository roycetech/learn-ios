//
//  ModelExtension.swift
//  CoreData-KeyPath-Demo
//
//  Created by Royce on 26/10/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

import Foundation
import CoreData
import UIKit


extension NSManagedObject  {
    
    static func context() -> NSManagedObjectContext {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Unable to access the AppDelegate!")
        }
        return appDelegate.context()
    }
    
    public func delete() {
        managedObjectContext?.delete(self)
    }
    
    @nonobjc public static func fetchRequest<T: NSManagedObject>(byFormat format: String, param: CVarArg, sortBy: String) -> NSFetchRequest<T> {
        
        let fetchRequest: NSFetchRequest<T> = T.fetchRequest() as! NSFetchRequest<T>
        fetchRequest.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [NSPredicate(format: format, param)])
        
        let colSort = NSSortDescriptor(key: sortBy, ascending: false)
        fetchRequest.sortDescriptors = [colSort]
        return fetchRequest
    }
    
    @nonobjc public class func fetchRequestWithSort<T: NSManagedObject>(column: String?) -> NSFetchRequest<T> {
        let fetchRequest: NSFetchRequest<T> = T.fetchRequest() as! NSFetchRequest<T>
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: column, ascending: true)]
        return fetchRequest
    }

    
    /** Create a NSManaged object but do not save. */
    public static func build() -> Self {
        return self.init(context: context())
    }
    
    public static func create() -> Self {
        return self.init(context: context())
    }
    
    
    
    //    @nonobjc public static func all<T: NSManagedObject>() -> [T] {
    //        do {
    //            let fetchRequest: NSFetchRequest<T> = T.fetchRequest() as! NSFetchRequest<T>
    //            return try context().fetch(fetchRequest) as? NSFetchRequestResult as! [T]
    //        } catch {
    //            let nserror = error as NSError
    //            fatalError("Error fetching all entities. \(nserror)")
    //        }
    //    }
}
