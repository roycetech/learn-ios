//
//  ViewController.swift
//  StepperDemo
//
//  Created by Royce on 24/10/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var textField: UITextField!
    
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        textField.text = String(Float(stepper.value))
    }
    

}

