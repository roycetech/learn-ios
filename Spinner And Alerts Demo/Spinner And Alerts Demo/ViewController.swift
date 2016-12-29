//
//  ViewController.swift
//  Spinner And Alerts Demo
//
//  Created by Royce on 26/12/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    var activityIndicator: UIActivityIndicatorView!

    
    @IBAction func buttonCreateAlertTapped(_ sender: UIButton) {
        let alertController = UIAlertController(title: "This is the title", message: "This is the message", preferredStyle: UIAlertControllerStyle.alert)

        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in
            print("OK Pressed")
            self.dismiss(animated: true, completion: nil)
        }))

        alertController.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.default, handler: { (action) in
            print("No Pressed")
            self.dismiss(animated: true, completion: nil)
        }))

        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func buttonPauseTapped(_ sender: UIButton) {
        activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()

        //        UIApplication.shared.beginIgnoringInteractionEvents()
    }
    
    @IBAction func buttonRestoreTapped(_ sender: UIButton) {
        activityIndicator.stopAnimating()

        //        UIApplication.shared.endIgnoringInteractionEvents()
    }
}

