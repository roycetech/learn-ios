//
//  FirstViewController.swift
//  Timer Demo
//
//  Created by Royce on 27/10/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, TimerAware {

    
    var timerCount: Int?
    var isRunning: Bool = false
    var timerHandler: TimerHandler?
    
    
    @IBOutlet weak var labelCounter: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let timerCount = self.timerCount {
            timerHandler = TimerHandler(startCount: timerCount, displayOn: labelCounter) {(count) in
                self.timerCount = count
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
    
    @IBAction func buttonStartPressed(_ sender: UIButton) {
        if let timerHandler = timerHandler {
            timerHandler.start()
        } else {
            timerHandler = TimerHandler(startCount: 0, displayOn: labelCounter, handlerTick: { (count) in
                self.timerCount = count
            })
            timerHandler?.start()
        }
    }
    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let timerHandler = timerHandler {
            timerHandler.prepare(for: segue)
        }
    }

}
