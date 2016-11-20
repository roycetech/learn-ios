//
//  ViewController.swift
//  The Night Watch
//
//  Created by Royce on 08/08/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITabkleViewDataSource {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func changeBackground(sender: UIButton) {
        view.backgroundColor = UIColor.darkGrayColor()
        
        let allSubviews = view.subviews
        for subview in allSubviews {
            if subview is UILabel {
                let label = subview as! UILabel
                label.textColor = UIColor.lightGrayColor()
            }
        }
    }
    
}

