//
//  TimerAware.swift
//  Timer Demo
//
//  Created by Royce on 27/10/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

import Foundation
import UIKit


protocol TimerAware {
    var timerCount: Int? {
        get set
    }
    
    var isRunning: Bool {
        get set
    }
}
