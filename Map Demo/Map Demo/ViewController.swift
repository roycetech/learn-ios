//
//  ViewController.swift
//  Map Demo
//
//  Created by Royce on 08/12/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

import UIKit
import MapKit


class ViewController: UIViewController {

    
    @IBOutlet weak var map: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        gotoLocation(lat: 27.1, long: 78.0, delta: 0.05)
        gotoLocation(lat: 14.594322, long: 120.994177, delta: 0.01) // Malacañang Palace
        
    }
    
    func gotoLocation(lat: CLLocationDegrees, long: CLLocationDegrees, delta: CLLocationDegrees) {
        let span = MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
        let coordinates = CLLocationCoordinate2D(latitude: lat, longitude: long)
        let region = MKCoordinateRegion(center: coordinates, span: span)
        map.setRegion(region, animated: true)
    }

}

