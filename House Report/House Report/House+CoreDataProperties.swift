//
//  House+CoreDataProperties.swift
//  House Report
//
//  Created by Royce on 07/08/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension House {

    @NSManaged var bath: NSNumber?
    @NSManaged var bed: NSNumber?
    @NSManaged var bgy: String?
    @NSManaged var image: Data?
    @NSManaged var price: NSNumber?
    @NSManaged var sqrm: NSNumber?
    @NSManaged var category: Category?
    @NSManaged var location: Location?
    @NSManaged var status: Status?

}
