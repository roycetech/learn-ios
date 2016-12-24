//
//  PlacesViewController.swift
//  My Places Demo
//
//  Created by Royce on 09/12/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

import UIKit


class PlacesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    

    var places: [Place]!

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        places = Place.loadAll()
        
        if places.isEmpty {
            let defaultPlace = Place(name: "Malacañang Palace", lat: 14.594322, lon: 120.994177)
            places.append(defaultPlace)
            Place.save(places: places)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tableView.reloadData()
    }
    
//    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete {
            places.remove(at: indexPath.row)
            Place.save(places: places)
            tableView.reloadData()
        }
    }
    
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = places[indexPath.row].name
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "Show Map", sender: places[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let mapController = segue.destination as? MapViewController {
            mapController.places = places
            if segue.identifier == "Show Map",
                let place = sender as? Place {
                mapController.place = place
            } else if segue.identifier == "Add Place" {
                mapController.place = nil
            }
        }
        
    }

}
