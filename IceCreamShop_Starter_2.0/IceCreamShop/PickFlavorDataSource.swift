//
//  PickFlavorDataSource.swift
//  IceCreamShop
//
//  Created by Joshua Greene on 2/8/15.
//  Copyright (c) 2015 Razeware, LLC. All rights reserved.
//

import UIKit

class PickFlavorDataSource: NSObject, UICollectionViewDataSource {
  
  // MARK: Identifiers
  
  fileprivate struct Identifiers {
    static let ScoopCell = "ScoopCell"
  }
  
  // MARK: Instance Variables
  
  var flavors = [Flavor]()
  
  // MARK: Outlets
  
  @IBOutlet var collectionView: UICollectionView!
  
  // MARK: UICollectionViewDataSource
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return flavors.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    return scoopCellAtIndexPath(indexPath)
  }
  fileprivate func scoopCellAtIndexPath(_ indexPath: IndexPath) -> UICollectionViewCell {
   
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifiers.ScoopCell, for: indexPath) as! ScoopCell
    configureScoopCell(cell, atIndexPath: indexPath)
    return cell
  }
  
  fileprivate func configureScoopCell(_ cell: ScoopCell, atIndexPath indexPath: IndexPath) {
    
    let flavor = flavors[(indexPath as NSIndexPath).row]
    cell.updateWithFlavor(flavor)
  }
  
}
