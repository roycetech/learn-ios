//
//  FlavorView.swift
//  IceCreamShop
//
//  Created by Joshua Greene on 2/8/15.
//  Copyright (c) 2015 Razeware, LLC. All rights reserved.
//

import UIKit

@IBDesignable

class ScoopView: UIView {
  
  // MARK: Variables
  
  @IBInspectable var topColor: UIColor = Flavor.vanilla().topColor {
    didSet {
      setNeedsDisplay()
    }
  }
  
  @IBInspectable var bottomColor: UIColor = Flavor.vanilla().bottomColor {
    didSet {
      setNeedsDisplay()
    }
  }
  
  // MARK: View Lifecycle
  
  override func draw(_ rect: CGRect) {
    
    let context = UIGraphicsGetCurrentContext()
    
    let path = CGPath(ellipseIn: bounds, transform: nil)
    context?.addPath(path)
    context?.clip()
    
    let gradient = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: [topColor.cgColor, bottomColor.cgColor], locations: [0, 1])
    let startPoint = CGPoint(x: bounds.midX, y: bounds.minY)
    let endPoint = CGPoint(x: bounds.midX, y: bounds.maxY)
    
    context.drawLinearGradient(gradient, start: startPoint, end: endPoint, options: CGGradientDrawingOptions())
  }
}
