//
//  SecondViewController.swift
//  Timer Demo
//
//  Created by Royce on 27/10/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, TimerAware {

    
    @IBOutlet weak var labelCounter: UILabel!
    
    
    var isRunning: Bool = false
    var timerCount: Int?
    var timerHandler: TimerHandler?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let timerCount = timerCount, timerCount > 0 {
            timerHandler = TimerHandler(startCount: timerCount, displayOn: self.labelCounter) {
                (count) in self.timerCount = count
            }
            timerHandler?.start()
        }
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let timerCount = timerCount {
            labelCounter.text = TimerHandler.format(count: timerCount)
        }
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let timerHandler = timerHandler {
            timerHandler.prepare(for: segue)
        }
    }

}
