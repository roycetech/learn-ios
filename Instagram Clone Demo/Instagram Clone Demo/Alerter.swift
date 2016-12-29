//
//  Alerter.swift
//  Instagram Clone Demo
//
//  Created by Royce on 27/12/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

import Foundation
import UIKit


class Alerter {
    
    static func create(controller: UIViewController, title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        controller.present(alert, animated: true, completion: nil)
    }
    
}
