//
//  ViewController.swift
//  Dynamic Label to StackView Demo
//
//  Created by Royce on 26/10/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addLabel(_ sender: UIButton) {
        let label = UILabel()
        label.text = "6x6"
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.cornerRadius = 2
        label.sizeToFit()
        print(label.frame.width)
        stackView.addArrangedSubview(label)
        
        let width = Int(label.frame.width) * stackView.subviews.count
        print(width)
        
        stackView.frame = CGRect(x: stackView.frame.origin.x , y: stackView.frame.origin.y, width: CGFloat(width) , height: stackView.frame.height)

        
        stackView.translatesAutoresizingMaskIntoConstraints = false;
        stackView.sizeToFit()
    }

}

