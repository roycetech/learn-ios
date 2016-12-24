//
//  ViewController.swift
//  My Places Demo
//
//  Created by Royce on 09/12/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var map: MKMapView!
    
    
    var place: Place?
    var places: [Place]!

    
    var manager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        attachGestureRecognizer()
        
        if let place = place {
            load(place: place)
        } else {
            manager.delegate = self
            manager.desiredAccuracy = kCLLocationAccuracyBest
            manager.requestWhenInUseAuthorization()
            manager.startUpdatingLocation()
        }
    }
    
    func attachGestureRecognizer() {
        let uilpgr = UILongPressGestureRecognizer(target: self, action: #selector(MapViewController.longpress(gestureRecognizer:)))
        uilpgr.minimumPressDuration = 1.5
        map.addGestureRecognizer(uilpgr)
    }
    
    func load(place: Place) {
        let coordinate = CLLocationCoordinate2D(latitude: place.lat, longitude: place.lon)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        self.map.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = place.name
        self.map.addAnnotation(annotation)
    }
    
    func longpress(gestureRecognizer: UIGestureRecognizer) {
        
        if gestureRecognizer.state == UIGestureRecognizerState.began {
            let touchPoint = gestureRecognizer.location(in: self.map)
            let newCoordinate = self.map.convert(touchPoint, toCoordinateFrom: self.map)
            
            getPlace(coordinate: newCoordinate) {
                (place) in
                self.places.append(place)
                Place.save(places: self.places)
            }
        }
    }
    
    func getPlace(coordinate: CLLocationCoordinate2D, completionHandler: @escaping (_ place: Place) -> Void) {
        
        let location = CLLocation(latitude: coordinate.latitude,
                                  longitude: coordinate.longitude)
        
        CLGeocoder().reverseGeocodeLocation(location, completionHandler: {
            (placemarks, error) in
            var title = ""
            if let error = error {
                print(error)
            } else {
                if let placemark = placemarks?[0] {
                    if placemark.subThoroughfare != nil {
                        title += placemark.subThoroughfare! + " "
                    }
                    if placemark.thoroughfare != nil {
                        title += placemark.thoroughfare!
                    }
                }
            }
            
            if title == "" {
                title = "Added \(NSDate())"
            }
            
            self.createAnnotation(title: title, coordinate: coordinate)
            let newPlace = Place(name: title, lat: coordinate.latitude,
                                 lon: coordinate.longitude)
            completionHandler(newPlace)
        })
    }
    
    func createAnnotation(title: String, coordinate: CLLocationCoordinate2D) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = title
        self.map.addAnnotation(annotation)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        self.map.setRegion(region, animated: true)
    }
}
