//
//  ViewController.swift
//  learn-swift
//
//  Created by Royce on 11/10/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Program Start.")
        
        let path = Bundle.main.path(forResource: "sample", ofType: "json")
        var data:NSData
        let json:AnyObject
        
        do {
            data = try NSData(contentsOfFile: path!)
            json = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.allowFragments) as AnyObject
        } catch {
            fatalError("Unable to read json file!")
        }
        
        if let nsDictionaryObject = json as? NSDictionary {
            print("It is a dictionary")
            
            if let swiftDictionary = nsDictionaryObject as NSDictionary? {
                // print(swiftDictionary)
                let array = swiftDictionary["house"] as! NSArray
                
                print(type(of: array[0]))
            }
        }
        
        print("Program End.")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

