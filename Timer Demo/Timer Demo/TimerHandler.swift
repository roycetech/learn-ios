//
//  TimerHandler.swift
//  Timer Demo
//
//  Created by Royce on 27/10/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

import Foundation
import UIKit


/** Encapsulates timer.  Supports start and stop, no pause or continue.  */
class TimerHandler {
    
    
    let label: UILabel?
    var timerCount: Int
    var isRunning: Bool = false
    var timer: Timer?
    let handlerTick: (Int)->Void
    
    
    var handlerStart: (()->Void)?
    var handlerStop: (()->Void)?
    
    
    init(startCount: Int, displayOn label: UILabel?, handlerTick: @escaping (Int)->Void) {
        self.timerCount = startCount
        self.label = label
        self.handlerTick = handlerTick
    }

    func start() {
        print("TimerHandler start()...")
        if isRunning {
            self.timerCount = 0
            timer?.invalidate()
        } else {
            isRunning = true
        }
        
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimerHandler.processTime), userInfo: nil, repeats: true)
        
        if let handlerStart = handlerStart {
            handlerStart()
        }
    }
    
    static func format(count: Int) -> String {
        let secondPart = String(format: "%02d", count % 60)
        let minutePart = String(format: "%02d", count / 60)
        return "\(minutePart):\(secondPart)"
    }
    
    @objc func processTime() {
        print("processTime...")
        self.timerCount += 1


        if let label = label {
            label.text = TimerHandler.format(count: timerCount)
        }

        if timerCount == 180 {
            timer?.invalidate()
            timer = nil
        }

        handlerTick( self.timerCount )
    }
    
    func stop() {
        isRunning = false
        
        if let handlerStop = handlerStop {
            handlerStop()
        }
    }
    
    func prepare(for segue: UIStoryboardSegue) {
        if var timerAware = segue.destination as? TimerAware {
            timerAware.timerCount = timerCount
            timerAware.isRunning = isRunning
        }        
    }
    
    
}
