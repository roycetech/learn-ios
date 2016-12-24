//
//  ViewController.swift
//  City Weather Demo
//
//  Created by Royce on 07/12/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var cityTextField: UITextField!
    @IBOutlet var resultLabel: UILabel!
    
    
    @IBAction func getWeather(_ sender: AnyObject) {
        
        guard let url = buildUrl(city: cityTextField.text!) else {
            resultLabel.text = "The URL is invalid!"
            return
        }
        
        let request = NSMutableURLRequest(url: url)
        URLSession.shared.dataTask(with: request as URLRequest, completionHandler: handleHttpRequest).resume()
    }
    
    func buildUrl(city: String) -> URL? {
        return URL(string: "http://www.weather-forecast.com/locations/" + city.replacingOccurrences(of: " ", with: "-") + "/forecasts/latest")
    }
    
    func extractMessage(from data: Data?) -> String {
        
        guard let data = data else {
            return ""
        }
        
        let dataString = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
        
        var stringSeparator = "Weather Forecast Summary:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">"
        
        var message = ""
        if let contentArray = dataString?.components(separatedBy: stringSeparator),
                contentArray.count > 1 {
            stringSeparator = "</span>"
            let newContentArray = contentArray[1].components(separatedBy: stringSeparator)
            if newContentArray.count > 1 {
                message = newContentArray[0].replacingOccurrences(of: "&deg;", with: "°")
                print(message)
            }
        }
        return message
        
    }
    
    func handleHttpRequest(data: Data?, response: URLResponse?, error: Error?) -> Void {
        var message = ""
        if let error = error {
            print(error)
        } else {
            message = extractMessage(from: data)
        }
        
        if message == "" {
            message = "The weather there couldn't be found. Please try again."
        }
        
        DispatchQueue.main.sync(execute: {
            self.resultLabel.text = message
        })
    }
    
}

