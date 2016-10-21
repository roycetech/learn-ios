//
//  FlavorFactory.swift
//  IceCreamShop
//
//  Created by Joshua Greene on 2/9/15.
//  Copyright (c) 2015 Razeware, LLC. All rights reserved.
//

import Foundation

class FlavorFactory {
  
  func flavorsFromPlistNamed(_ plistName: String, bundle: Bundle = Bundle.main) -> [Flavor] {
    
    let path = bundle.path(forResource: plistName, ofType: "plist")!
    let data = try! Data(contentsOf: URL(fileURLWithPath: path))

    let options = PropertyListSerialization.MutabilityOptions();
    
    let array = try! PropertyListSerialization.propertyList(from: data, options: options, format: nil) as! [[String: String]]
    return flavorsFromDictionaryArray(array)
  }
  
  func flavorsFromDictionaryArray(_ array: [[String: String]]) -> [Flavor] {
    
    var flavors: [Flavor] = []
    
    for dictionary in array {
      
      if let flavor = Flavor(dictionary: dictionary) {
        flavors.append(flavor)
      }
    }
    
    return flavors
  }
}
