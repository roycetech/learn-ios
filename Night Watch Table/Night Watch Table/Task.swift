//
//  Routine.swift
//  Night Watch Table
//
//  Created by Royce on 09/08/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

import Foundation

enum TaskType {
    case Daily, Weekly, Biweekly
}


struct Task {
    
    var name: String
    var type: TaskType
    var done: Bool
    var lastDone: NSDate?
    
}