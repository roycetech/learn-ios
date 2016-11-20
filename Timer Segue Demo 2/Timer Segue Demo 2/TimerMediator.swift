//
//  TimerMediator.swift
//  Timer Segue Demo 2
//
//  Created by Royce on 27/10/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

import Foundation

class TimerMediator {
    
    
    var timerCount: Int
    var timeProcessor: ((Timer, Int) -> Void)?


    init(timerCount: Int) {
        self.timerCount = timerCount
    }
    
    @objc func timerFireMethod(timer: Timer) {
        timerCount += 1

        if let timeProcessor = timeProcessor {
            timeProcessor(timer, timerCount)
        }
    }
    
}
