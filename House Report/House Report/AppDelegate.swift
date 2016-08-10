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
    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
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
    
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
    }
    
    func checkDataStore() {
        let coreData = CoreData()
        let request = NSFetchRequest(entityName: "House")
        let houseCount = coreData.managedObjectContext.countForFetchRequest(request, error: nil)
        
        print("Total house: \(houseCount)")
        if houseCount == 0 {
            uploadSampleData()
        }
    }
    
    func uploadSampleData() {
        let coreData = CoreData()
        let url = NSBundle.mainBundle().URLForResource("sample", withExtension: "json")
        let data = NSData(contentsOfURL: url!)
        
        do {
            let jsonResult = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
            let jsonArray = jsonResult.valueForKey("house") as! NSArray
            
            for json in jsonArray {
                let house = NSEntityDescription.insertNewObjectForEntityForName("House", inManagedObjectContext: coreData.managedObjectContext) as! House
                house.bgy = json["bgy"] as? String
                house.price = json["price"] as? NSNumber
                house.bed = json["bed"] as? NSNumber
                house.bath = json["bath"] as? NSNumber
                house.sqrm = json["sqrm"] as? NSNumber
                
                let category = NSEntityDescription.insertNewObjectForEntityForName("Category", inManagedObjectContext: coreData.managedObjectContext) as! Category
                category.houseType = (json["category"] as! NSDictionary)["houseType"] as? String
                house.category = category
                
                let status = NSEntityDescription.insertNewObjectForEntityForName("Status", inManagedObjectContext: coreData.managedObjectContext) as! Status
                let isForSale = (json["status"] as! NSDictionary)["isForRent"] as! Bool
                status.isForSale = NSNumber(bool: isForSale)
                house.status = status
                
                let location = NSEntityDescription.insertNewObjectForEntityForName("Location", inManagedObjectContext: coreData.managedObjectContext) as! Location
                location.city = json["city"] as? String
                house.location = location
                
                let imageName = json["image"] as? String
                let image = UIImage(named: imageName!)
                let imageData = UIImageJPEGRepresentation(image!, 1.0)
                house.image = imageData
            }
            coreData.saveContext()
            
            let request = NSFetchRequest(entityName: "House")
            let houseCount = coreData.managedObjectContext.countForFetchRequest(request, error: nil)
            
            print("Total house: \(houseCount)")
        } catch {
            fatalError("Error in reading data.")
        }
        
        
    }
    
}

