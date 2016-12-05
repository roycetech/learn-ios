//
//  ViewController.swift
//  Fetching Web Content
//
//  Created by Royce on 05/12/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        /*
         let url = URL(string: "https://www.stackoverflow.com")!
         webview.loadRequest(URLRequest(url: url))
         webview.loadHTMLString("<h1>Hello there!</h1>", baseURL: nil)
         */
        
        if let url = URL(string: "https://www.stackoverflow.com") {
            let request = NSMutableURLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request as URLRequest) {
                data, response, error in
                if let error = error {
                    print(error as Any)
                } else {
                    if let data = data {
                        let dataString = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
                        print(dataString as Any)
                        DispatchQueue.main.sync(execute: {
                            // Update UI
                        })
                    }
                }
            }
            task.resume()
        }
        print("viewDidLoad finished.")
    }
}
