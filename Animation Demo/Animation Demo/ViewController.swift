//
//  ViewController.swift
//  Animation Demo
//
//  Created by Royce on 07/12/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var buttonAnimate: UIButton!
    
    var counter = 0
    var isAnimating = false
    var timer: Timer!
    
    let LAST_FRAME_INDEX = 28

    
    var origWidth: CGFloat!
    var origHeight: CGFloat!
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        origWidth = image.frame.width
        origHeight = image.frame.height
    }
    
    
    func animate() {
        image.image = UIImage(named: "frame_\(counter)_delay-0.01s.gif")
        counter += 1
        if counter == LAST_FRAME_INDEX {
            counter = 0
        }
    }
    
    @IBAction func animateTapped(_ sender: UIButton) {
        if isAnimating {
            timer.invalidate()
            buttonAnimate.setTitle("Start Animation", for: [])
            isAnimating = false
        } else {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.animate), userInfo: nil, repeats: true)
            buttonAnimate.setTitle("Stop Animation", for: [])
            isAnimating = true
        }
        
    }
    @IBAction func fadeInTapped(_ sender: UIButton) {
        image.alpha = 0
        UIView.animate(withDuration: 3, animations: {
            self.image.alpha = 1
        })
    }
    @IBAction func slideInTapped(_ sender: UIButton) {
        image.center = CGPoint(x: image.center.x - 500, y: image.center.y)
        UIView.animate(withDuration: 2) {
            self.image.center = CGPoint(x: self.image.center.x + 500, y: self.image.center.y)
        }
    }
    @IBAction func growTapped(_ sender: UIButton) {
        image.frame = CGRect(x: image.frame.minX, y: image.frame.minY, width: 0, height: 0)
        UIView.animate(withDuration: 1) {
            self.image.frame = CGRect(x: self.image.frame.minX, y: self.image.frame.minY, width: self.origWidth, height: self.origHeight)
        }
    }
    

}

