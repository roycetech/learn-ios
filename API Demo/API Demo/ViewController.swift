//
//  ViewController.swift
//  API Demo
//
//  Created by Royce on 24/12/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var textFieldCity: UITextField!
    
    
    @IBAction func submitTapped(_ sender: UIButton) {

        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=" + textFieldCity.text!.replacingOccurrences(of: " ", with: "%20") + ",uk&appid=\(API_KEY)")  else {

            labelDescription.text = "Couldn't find weather for that city - please try another."
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print(error)
                return
            }
            
            if let urlContent = data {
                do {
                    let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                    
                    if let description = ((jsonResult["weather"] as? NSArray)?[0] as? NSDictionary)?["description"] as? String {
                        DispatchQueue.main.sync(execute: {
                            self.labelDescription.text = description
                            
                        })
                    }
                } catch {
                    print("JSON Processing Failed")
                }
            }
        }
        task.resume()
    }
}

