//
//  ViewController.swift
//  Custom Control Capsule
//
//  Created by Royce on 15/11/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var capsule: UICapsule!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        capsule.layer.cornerRadius = 5
        capsule.weight = 900
        capsule.reps = 12
        
//        textView.textContainerInset = UIEdgeInsetsMake(10, 0, 10, 0);
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
//        let constraintWeightWidth = NSLayoutConstraint (item: capsule.labelWeight,
//                                                        attribute: NSLayoutAttribute.width,
//                                                        relatedBy: NSLayoutRelation.equal,
//                                                        toItem: nil,
//                                                        attribute: NSLayoutAttribute.notAnAttribute,
//                                                        multiplier: 1,
//                                                        constant: 33)
//        self.view.addConstraint(constraintWeightWidth)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

