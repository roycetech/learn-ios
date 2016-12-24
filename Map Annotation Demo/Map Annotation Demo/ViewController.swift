//
//  ViewController.swift
//  Map Annotation Demo
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
        
        let coordinates = gotoLocation(lat: 14.594322, long: 120.994177, delta: 0.01) // Malacañang Palace

        addSampleAnnotation(coordinates: coordinates,
                            title: "Malacañang Palace",
                            subtitle: "I hope someday somebody super nice and intelligent lives here.")
        
        addGestureRecognizerToMap()
    }
    
    func gotoLocation(lat: CLLocationDegrees, long: CLLocationDegrees, delta: CLLocationDegrees) -> CLLocationCoordinate2D {
        let span = MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
        let coordinates = CLLocationCoordinate2D(latitude: lat, longitude: long)
        let region = MKCoordinateRegion(center: coordinates, span: span)
        map.setRegion(region, animated: true)
        return coordinates
    }
    
    func addSampleAnnotation(coordinates: CLLocationCoordinate2D, title: String, subtitle: String) {
        let annotation = MKPointAnnotation()
        annotation.title = title
        annotation.subtitle = subtitle
        annotation.coordinate = coordinates
        map.addAnnotation(annotation)
    }
    
    func addGestureRecognizerToMap() {
        let uilpgr = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longpress(gestureRecognizer:)))
        uilpgr.minimumPressDuration = 1.5
        map.addGestureRecognizer(uilpgr)
    }
    
    func longpress(gestureRecognizer: UIGestureRecognizer) {
        let touchPoint = gestureRecognizer.location(in: map)
        let coordinate = map.convert(touchPoint, toCoordinateFrom: map)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "New place"
        annotation.subtitle = "Maybe I'll go here too..."
        map.addAnnotation(annotation)
    }
    

}

