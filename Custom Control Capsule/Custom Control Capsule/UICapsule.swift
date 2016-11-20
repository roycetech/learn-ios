//
//  UICapsule.swift
//  Custom Control Capsule
//
//  Created by Royce on 15/11/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

import UIKit

class UICapsule: UIView {
    
    var weight = 997.5 {
        didSet(newValue) {
            self.labelWeight.text = formatWeight(weight: newValue)
            setNeedsLayout()
        }
    }
    
    var reps = 12 {
        didSet(newValue) {
            self.labelReps.text = "\(newValue)"
            setNeedsLayout()
        }
    }
    
    var labelWeight: UILabel
    var labelReps: UILabel
    
    required init?(coder aDecoder: NSCoder) {
        self.labelWeight = UILabel(frame: CGRect(x: 0, y: 0, width: 33, height: 20))
        self.labelReps = UILabel(frame: CGRect(x: 33, y: 0, width: 20, height: 20))
        
        let helveticaFont = UIFont(name: "Helvetica Neue", size: 13.0)
        self.labelWeight.text = "1000"
        self.labelWeight.textAlignment = NSTextAlignment.right
        self.labelWeight.font = helveticaFont
        self.labelWeight.textColor = UIColor.white
        
        self.labelReps.textAlignment = NSTextAlignment.center
        self.labelReps.textColor = UIColor.white
        self.labelReps.font = helveticaFont
        
        super.init(coder: aDecoder)
        
        self.labelWeight.backgroundColor = UIColor(netHex: 0x1A98FC)
        self.labelReps.backgroundColor = UIColor(netHex: 0x2323C4)
        addSubview(self.labelWeight)
        addSubview(self.labelReps)
    }
    
    func formatWeight(weight: Double) -> String {
        if weight.truncatingRemainder(dividingBy: 1) == 0 {
            return String(describing: Int(weight))
        } else {
            return String(describing: weight)
        }
    }
}

/** extension to UIColor to allow setting the color
 value by hex value */
extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int) {
        /** Verify that we have valid values */
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    /** Initializes and sets color by hex value */
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
    
}



