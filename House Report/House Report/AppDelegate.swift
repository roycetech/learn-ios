//
//  AppDelegate.swift
//  House Report
//
//  Created by Royce on 07/08/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

import UIKit
import CoreData


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        injectManagedObjectContext()
        
        checkDataStore()
        
        return true
    }
    
    
    /** 
      * Injects managed object context to the first and
      * second view controller. 
      */
    func injectManagedObjectContext() {
        let coreData = CoreData()
        let managedObjectContext = coreData.managedObjectContext
        
        let tabController = self.window?.rootViewController as! UITabBarController
        
        let firstNavController = tabController.viewControllers![0] as! UINavigationController
        let firstViewController = firstNavController.topViewController as! FirstViewController
        firstViewController.managedObjectContext = managedObjectContext

        let secondNavController = tabController.viewControllers![1] as! UINavigationController
        let secondViewController = secondNavController.topViewController as! SecondViewController
        secondViewController.managedObjectContext = managedObjectContext        
    }
    
    func checkDataStore() {
        let coreData = CoreData()
        let request = NSFetchRequest<House>(entityName: "House")
        do {
            let houseCount = try coreData.managedObjectContext.count(for: request)
            print("Total house: \(houseCount)")
            if houseCount == 0 {
                uploadSampleData()
            }
        } catch {
            fatalError("Error in reading data.")
        }
    }
    
    func uploadSampleData() {
        let coreData = CoreData()

        let path = Bundle.main.path(forResource: "sample", ofType: "json")
        var data:NSData
        let jsonResult:AnyObject
        
        do {
            data = try NSData(contentsOfFile: path!)
            jsonResult = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.allowFragments) as AnyObject
        } catch {
            fatalError("Unable to read json file!")
        }

//        
//        let url = Bundle.main.url(forResource: "sample", withExtension: "json")
//        _ = try? Data(contentsOf: url!)
        
        do {

//            let path = Bundle.main.path(forResource: "data", ofType: "json")
//            var data: NSData
//            let jsonResult:AnyObject
//            do {
//                data = try NSData(contentsOfFile: path!)
//                jsonResult = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.allowFragments) as AnyObject
//            } catch {
//                fatalError("Error in reading data.")
//            }
            
            // JSONObjectWithData returns AnyObject so the first thing to do is to downcast this to a known type
            if let nsDictionaryObject = jsonResult as? NSDictionary {
                if let swiftDictionary = nsDictionaryObject as Dictionary? {
                    print(swiftDictionary)
                }
            }
            else if let nsArrayObject = jsonResult as? NSArray {
                if let swiftArray = nsArrayObject as Array? {
                    print(swiftArray)
                }
            }
            
            let jsonArray = jsonResult["house"] as! NSArray
            for json in jsonArray {
                
                let house = NSEntityDescription.insertNewObject(forEntityName: "House", into: coreData.managedObjectContext) as! House
                
                let houseMap = json as! NSDictionary
                
                house.bgy = houseMap["bgy"] as? String
                house.price = houseMap["price"] as? NSNumber
                house.bed = houseMap["bed"] as? NSNumber
                house.bath = houseMap["bath"] as? NSNumber
                house.sqrm = houseMap["sqrm"] as? NSNumber
                
                let category = NSEntityDescription.insertNewObject(forEntityName: "Category", into: coreData.managedObjectContext) as! Category
                category.houseType = (houseMap["category"] as! NSDictionary)["houseType"] as? String
                house.category = category
                
                let status = NSEntityDescription.insertNewObject(forEntityName: "Status", into: coreData.managedObjectContext) as! Status
                let isForSale = (houseMap["status"] as! NSDictionary)["isForRent"] as! Bool
                status.isForSale = NSNumber(value: isForSale as Bool)
                house.status = status
                
                let location = NSEntityDescription.insertNewObject(forEntityName: "Location", into: coreData.managedObjectContext) as! Location
                location.city = houseMap["city"] as? String
                house.location = location
                
                let imageName = houseMap["image"] as? String
                let image = UIImage(named: imageName!)
                let imageData = UIImageJPEGRepresentation(image!, 1.0)
                house.image = imageData
            }
            coreData.saveContext()
            
            let request = NSFetchRequest<House>(entityName: "House")
            let houseCount = try coreData.managedObjectContext.count(for: request)
            print("Total house: \(houseCount)")
        } catch {
            fatalError("Error in reading data.")
        }
        
        
    }
    
}

