//
//  ViewController.swift
//  Location Aware Demo
//
//  Created by Royce on 08/12/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

import UIKit
import CoreLocation


class ViewController: UIViewController, CLLocationManagerDelegate {

    
    @IBOutlet weak var labelLatitude: UILabel!
    @IBOutlet weak var labelLongitude: UILabel!
    @IBOutlet weak var labelCourse: UILabel!
    @IBOutlet weak var labelSpeed: UILabel!
    @IBOutlet weak var labelAltitude: UILabel!
    @IBOutlet weak var labelAddress: UILabel!
    
    
    var manager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations[0]
        
        labelLatitude.text = String(location.coordinate.latitude)
        labelLongitude.text = String(location.coordinate.longitude)
        labelCourse.text = String(location.course)
        labelSpeed.text = String(location.speed)
        labelAltitude.text = String(location.altitude)
        
        buildAddress(location: location)
    }
    
    func buildAddress(location: CLLocation) {
        CLGeocoder().reverseGeocodeLocation(location) { (placemarks, error) in
            
            guard error == nil else {
                print(error!)
                return
            }
            
            if let placemark = placemarks?[0] {
                var address = ""
                
                address += self.extract(placemark.subThoroughfare, padding: " ")
                address += self.extract(placemark.thoroughfare)
                address += self.extract(placemark.subLocality)
                address += self.extract(placemark.subAdministrativeArea)
                address += self.extract(placemark.postalCode)
                address += self.extract(placemark.country)
                
                print(address)
                
                self.labelAddress.text = address
            }
        }
    }
    
    func extract(_ str: String?) -> String {
        return extract(str, padding: "\n")
    }

    func extract(_ str: String?, padding: String) -> String {
        if let str = str {
            return str + padding
        }
        return ""
    }

}

