//
//  ViewController.swift
//  User Location Demo
//
//  Created by Royce on 08/12/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit


class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    
    @IBOutlet weak var map: MKMapView!
    
    
    var locationManager = CLLocationManager()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation = locations[0]
        gotoLocation(coordinates: userLocation.coordinate, delta: 0.01)
    }

    func gotoLocation(coordinates: CLLocationCoordinate2D, delta: CLLocationDegrees) {
        let span = MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
        let region = MKCoordinateRegion(center: coordinates, span: span)
        map.setRegion(region, animated: true)
    }
    
    func gotoLocation(lat: CLLocationDegrees, long: CLLocationDegrees, delta: CLLocationDegrees) {
        let coordinates = CLLocationCoordinate2D(latitude: lat, longitude: long)
        gotoLocation(coordinates: coordinates, delta: delta)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }

}

