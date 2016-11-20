//
//  ViewController.swift
//  Alert Demo
//
//  Created by Royce on 13/11/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        
        let getPinNameAlert = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert)
        
        getPinNameAlert.addTextField(configurationHandler: { (textField) -> Void in
            
            textField.keyboardType = UIKeyboardType.default
//            textField.clearsOnBeginEditing = true
            textField.text = "Hadooken"

        })
        
        self.present(getPinNameAlert, animated: true, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

