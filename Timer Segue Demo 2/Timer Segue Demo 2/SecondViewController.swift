//
//  SecondViewController.swift
//  Timer Segue Demo 2
//
//  Created by Royce on 27/10/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var timerMediator: TimerMediator!
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let first = segue.destination as? FirstViewController {
            first.timerMediator = timerMediator
        }
    }

}
