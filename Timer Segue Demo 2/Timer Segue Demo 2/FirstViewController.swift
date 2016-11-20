//
//  FirstViewController.swift
//  Timer Segue Demo 2
//
//  Created by Royce on 27/10/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    
    var timer: Timer!
    var timerMediator: TimerMediator?

    
    @IBOutlet var labelCounter: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // If passed, reset
        if let timerMediator = timerMediator {
            timerMediator.timeProcessor = {
                (timer, count) in self.labelCounter.text = String(describing: count)
                if count >= 10 {
                    print("Stopping timer")
                    timer.invalidate()
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let timerMediator = timerMediator {
            labelCounter.text = String(timerMediator.timerCount)
        }
    }
    
    @IBAction func buttonStartTimerPressed(_ sender: UIButton) {
        if let timer = timer {
            timer.invalidate()
        }
        
        timerMediator = TimerMediator(timerCount: 0)
        timer = Timer.scheduledTimer(timeInterval: 1, target: timerMediator!, selector: #selector(TimerMediator.timerFireMethod), userInfo: nil, repeats: true)
        
//        myTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "updateTimer:", userInfo: nil, repeats: true)
        
        timerMediator?.timeProcessor = {
            (timer, count) in self.labelCounter.text = String(describing: count)
            if count >= 10 {
                print("Stopping timer")
                timer.invalidate()
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let second = segue.destination as? SecondViewController {
            second.timerMediator = timerMediator
        }
    }

    
}
