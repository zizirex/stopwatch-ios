//
//  ViewController.swift
//  Stopwatch
//
//  Created by Raditya Amandra Iskandar on 1/14/19.
//  Copyright © 2019 Raditya Amandra Iskandar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startButtonTapped: UIButton!
    @IBOutlet weak var stopButtonTapped: UIButton!
    @IBOutlet weak var resetButtonTapped: UIButton!
    @IBOutlet weak var elapsedTimeLabel: UILabel!
    @IBOutlet weak var darkBG: UIView!
    
    var counter = 0.0
    var timer = Timer()
    var isPlaying = false
    var laps = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.isHidden = true // Hide the Timelabel at the start of program
        stopButtonTapped.isEnabled = false // Disable the pause button when clock is not running
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func startTimer(_ sender: Any) {
        
        if(isPlaying) {
            return
        }
        startButtonTapped.isEnabled = false
        stopButtonTapped.isEnabled = true
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
        isPlaying = true
    }

    @IBAction func stopTimer(_ sender: Any) {
        
        startButtonTapped.isEnabled = true
        stopButtonTapped.isEnabled = false
        timeLabel.isHidden = false
        timer.invalidate()
        
        laps = elapsedTimeLabel.text ?? "00:00:00"
        timeLabel.text = "Lap Time:" + laps
        print(laps)
        isPlaying = false
    }
    @IBAction func resetTimer(_ sender: Any) {
        print("Reset Button tapped")
        startButtonTapped.isEnabled = true
        stopButtonTapped.isEnabled = false
        timeLabel.isHidden = true
        timer.invalidate()
        isPlaying = false
        counter = 0.0
        elapsedTimeLabel.text = "00:00:00"
    }
    
    
    @objc func UpdateTimer() {
    counter += 0.1
    let minutes = Int(counter / 60)
    let seconds = Int(counter.truncatingRemainder(dividingBy: 60))
    let tenths = Int((counter*10).truncatingRemainder(dividingBy: 10))
    elapsedTimeLabel.text = String(format: "%02d:%02d:%02d", minutes, seconds, tenths)
}
    }
    


