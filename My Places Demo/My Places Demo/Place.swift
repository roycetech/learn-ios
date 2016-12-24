//
//  Place.swift
//  My Places Demo
//
//  Created by Royce on 09/12/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

import Foundation
import CoreLocation

class Place: NSObject, NSCoding {
    
    var name: String
    var lat: CLLocationDegrees
    var lon: CLLocationDegrees

    init(name: String, lat: CLLocationDegrees, lon: CLLocationDegrees) {
        self.name = name
        self.lat = lat
        self.lon = lon
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: "name") as! String
        let latNum = aDecoder.decodeObject(forKey: "lat") as! NSNumber
        let lonNum = aDecoder.decodeObject(forKey: "lon") as! NSNumber
        self.init(name: name,
                  lat: latNum.doubleValue as CLLocationDegrees,
                  lon: lonNum.doubleValue as CLLocationDegrees)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(NSNumber(floatLiteral: lat), forKey: "lat")
        aCoder.encode(NSNumber(floatLiteral: lon), forKey: "lon")
    }    
    
    static func loadAll() -> [Place] {
        if let decoded  = UserDefaults.standard.object(forKey: "places") as? Data,
            let places = NSKeyedUnarchiver.unarchiveObject(with: decoded) as? [Place] {
            return places
        }
        return []
    }
    
    static func save(places: [Place]) {
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: places)
        UserDefaults.standard.set(encodedData, forKey: "places")
        UserDefaults.standard.synchronize()
    }
    
}
