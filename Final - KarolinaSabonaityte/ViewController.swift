//
//  ViewController.swift
//  Final - KarolinaSabonaityte
//
//  Created by Karolina Sabonaityte on 11/9/17.
//  Copyright © 2017 Karolina Sabonaityte. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer = Timer()
    var timerStart: NSDate?
    var counter = 0
    var seconds = 60
    var isTimerRunning = false
 
    @IBOutlet var label: UILabel!
    
    @IBOutlet var viewPic: UIImageView!
    
    func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i", hours, minutes, seconds)
    }
    
    func startTimer(){
        //timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        self.timerStart = NSDate()
    }
    
    @objc func updateTimer() {
        seconds -= 1
        label.text = "\(seconds)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "\(seconds)"
        startTimer()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

