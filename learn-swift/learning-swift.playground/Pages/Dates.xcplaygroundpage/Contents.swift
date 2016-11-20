import Foundation
extension NSDate {
    var startOfDay: NSDate {
        return NSCalendar.current.startOfDay(for: self as Date) as NSDate
    }
    
    var endOfDay: NSDate? {
        var components = DateComponents()
        components.day = 1
        components.second = -1
        
        return NSCalendar.current.date(byAdding: components, to: startOfDay  as Date) as? NSDate
    }
}


import Foundation
let date = NSDate()
let d = date as Date
let d2 = d as NSDate

d2.startOfDay
d2.endOfDay
