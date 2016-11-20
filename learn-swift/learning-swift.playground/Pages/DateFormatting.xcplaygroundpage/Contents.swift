import Foundation

let dateFormatter = DateFormatter()
let currentDate = Date()

let dayFormatter = DateFormatter()
dayFormatter.dateFormat = "EEEE"
let day = dayFormatter.string(from: currentDate)

dateFormatter.dateStyle = DateFormatter.Style.medium
let medium = dateFormatter.string(from: currentDate)

let label = "\(day) \(medium)"
let today = Date()
let start = NSCalendar.current.startOfDay(for: today)

var components = DateComponents()
components.day = 1
components.second = -1
let end = Calendar.current.date(byAdding: components, to: start)

extension Date {
    func startTime() -> Date {
        return Calendar.current.startOfDay(for: self)
    }
    
    func endTime() -> Date {
        var components = DateComponents()
        components.day = 1
        components.second = -1
        return Calendar.current.date(byAdding: components, to: startTime())!
    }
}


let ngayon = Date()
ngayon.startTime()
ngayon.endTime()


