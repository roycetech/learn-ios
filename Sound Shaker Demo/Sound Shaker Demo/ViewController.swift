//
//  ViewController.swift
//  Sound Shaker Demo
//
//  Created by Royce on 23/12/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        
        if event?.subtype == UIEventSubtype.motionShake {
            let soundArray = ["boing", "explosion", "hit", "knife", "shoot", "swish", "wah", "warble"]
            
            let randomNumber = Int(arc4random_uniform(UInt32(soundArray.count)))
            let fileLocation = Bundle.main.path(forResource: soundArray[randomNumber], ofType: "mp3")
            
            try? player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileLocation!))
            player?.play()
        }
    }
}


