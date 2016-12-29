//
//  Event+CoreDataClass.swift
//  Blog Reader Demo
//
//  Created by Royce on 25/12/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData

@objc(Event)
public class Event: NSManagedObject {

    public func save() {
        save() {
            (error) in
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
    
    public func save(failure: (Error) -> Void) {
        do {
            try self.managedObjectContext?.save()
        } catch {
            failure(error)
        }
    }
    
    public func delete() {
        managedObjectContext?.delete(self)
    }
    
    public static func createFrom(array: [AnyObject], context: NSManagedObjectContext) {
        for element in array as [AnyObject] {
            let newEvent = Event(context: context)
            newEvent.timestamp = NSDate()
            newEvent.published = element["published"] as? String
            newEvent.title = element["title"] as? String
            newEvent.content = element["content"] as? String
        }
        do {
            try context.save()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
    
    public static func deleteAll(context: NSManagedObjectContext) {
        let request:NSFetchRequest<Event> = Event.fetchRequest()
        do {
            let events = try context.fetch(request)
            if events.count > 0 {
                for event in events {
                    event.delete()
                    event.save {
                        (error) in
                        print("Specific delete failed")
                    }
                }
            }
            
        } catch {
            print("Delete fetch failed")
        }
    }
    
    
}
