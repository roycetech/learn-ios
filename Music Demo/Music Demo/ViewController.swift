//
//  ViewController.swift
//  Music Demo
//
//  Created by Royce on 09/12/2016.
//  Copyright © 2016 Ryetech. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {


    @IBOutlet weak var sliderVolume: UISlider!


    var player: AVAudioPlayer!


    override func viewDidLoad() {
        super.viewDidLoad()

        if let audioPath = Bundle.main.path(forResource: "Fallin", ofType: "mp3") {
            player = try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
            sliderVolume.value = player.volume
        }
    }

    @IBAction func barButtonPlayTapped(_ sender: Any) {
        player.play()
    }

    @IBAction func barButtonPauseTapped(_ sender: UIBarButtonItem) {
        player.pause()
    }

    @IBAction func sliderMoved(_ sender: UISlider) {
        player.volume = sender.value
    }

}

