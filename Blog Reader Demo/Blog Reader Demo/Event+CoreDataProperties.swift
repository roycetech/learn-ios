//
//  Event+CoreDataProperties.swift
//  Blog Reader Demo
//
//  Created by Royce on 25/12/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Event {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Event> {
        return NSFetchRequest<Event>(entityName: "Event");
    }

    @NSManaged public var timestamp: NSDate?
    @NSManaged public var content: String?
    @NSManaged public var published: String?
    @NSManaged public var title: String?

}
