//
//  Detail+CoreDataProperties.swift
//  CoreData-KeyPath-Demo
//
//  Created by Royce on 26/10/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

import Foundation
import CoreData

extension Detail {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Detail> {
        return NSFetchRequest<Detail>(entityName: "Detail");
    }

    @NSManaged public var name: String?
    public var section: String? {
        get {
            return "\(master?.name) Yo!"
        }
    }
    @NSManaged public var master: Master?

}
