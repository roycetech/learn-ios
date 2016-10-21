//
//  ViewController.swift
//  IceCreamShop
//
//  Created by Joshua Greene on 2/8/15.
//  Copyright (c) 2015 Razeware, LLC. All rights reserved.
//

import UIKit

open class PickFlavorViewController: UIViewController, UICollectionViewDelegate {
  
  // MARK: Instance Variables
  
  var flavors: [Flavor] = [] {
    
    didSet {
      pickFlavorDataSource?.flavors = flavors
    }
  }
  
  fileprivate var pickFlavorDataSource: PickFlavorDataSource? {
    return collectionView?.dataSource as! PickFlavorDataSource?
  }
  
  fileprivate let flavorFactory = FlavorFactory()
  
  // MARK: Outlets
  
  @IBOutlet var contentView: UIView!
  @IBOutlet var collectionView: UICollectionView!
  @IBOutlet var iceCreamView: IceCreamView!
  @IBOutlet var label: UILabel!
  
  // MARK: View Lifecycle
  
  open override func viewDidLoad() {
    
    super.viewDidLoad()
    loadFlavors()
  }
  
  fileprivate func loadFlavors() {
    // TO-DO: Implement this
  }
  
  fileprivate func selectFirstFlavor() {
    
    if let flavor = flavors.first {
      updateWithFlavor(flavor)
    }
  }
  
  // MARK: UICollectionViewDelegate
  
  open func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    let flavor = flavors[(indexPath as NSIndexPath).row]
    updateWithFlavor(flavor)
  }
  
  // MARK: Internal
  
  fileprivate func updateWithFlavor(_ flavor: Flavor) {
    
    iceCreamView.updateWithFlavor(flavor)
    label.text = flavor.name
  }
}
