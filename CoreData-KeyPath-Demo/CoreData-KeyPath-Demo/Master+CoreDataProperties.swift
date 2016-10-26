//
//  Master+CoreDataProperties.swift
//  CoreData-KeyPath-Demo
//
//  Created by Royce on 26/10/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

import Foundation
import CoreData

extension Master {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Master> {
        return NSFetchRequest<Master>(entityName: "Master");
    }

    @NSManaged public var name: String?
    @NSManaged public var detail: NSSet?

}

// MARK: Generated accessors for detail
extension Master {

    @objc(addDetailObject:)
    @NSManaged public func addToDetail(_ value: Detail)

    @objc(removeDetailObject:)
    @NSManaged public func removeFromDetail(_ value: Detail)

    @objc(addDetail:)
    @NSManaged public func addToDetail(_ values: NSSet)

    @objc(removeDetail:)
    @NSManaged public func removeFromDetail(_ values: NSSet)

}
