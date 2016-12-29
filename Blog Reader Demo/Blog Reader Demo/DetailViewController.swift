//
//  DetailViewController.swift
//  Blog Reader Demo
//
//  Created by Royce on 24/12/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!

    func configureView() {
        if let detail = self.detailItem {
            self.title = detail.title
            if let blogWebView = self.webView, let content = detail.content {
                blogWebView.loadHTMLString(content, baseURL: nil)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }

    var detailItem: Event? {
        didSet {
            self.configureView()
        }
    }

}

