//
//  Category+CoreDataProperties.swift
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

extension Category {

    @NSManaged var houseType: String?
    @NSManaged var house: House?

}
