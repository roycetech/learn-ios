//
//  Master+CoreDataClass.swift
//  CoreData-KeyPath-Demo
//
//  Created by Royce on 26/10/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

import Foundation
import CoreData


public class Master: NSManagedObject {
    
    public static func getBy(name: String) -> Master? {
        let fetchRequest: NSFetchRequest<Master> = Master.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "name == %@", name)
        let nameSort = NSSortDescriptor(key: "name", ascending: false)
        fetchRequest.sortDescriptors = [nameSort]
        
        do {
            let objects = try context().fetch(fetchRequest)
            if objects.count == 0 {
                return nil
            } else {
                return objects[0] as Master
            }
        } catch {
            fatalError("Failed to get or create! \(error)")
        }

        
    }

    
}
