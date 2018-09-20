//
//  MyViewController.swift
//  Final - KarolinaSabonaityte
//
//  Created by Karolina Sabonaityte on 11/14/17.
//  Copyright © 2017 Karolina Sabonaityte. All rights reserved.
//

import UIKit
import AVFoundation

class MyViewController: UIViewController, AVAudioPlayerDelegate {
    
    var timer = Timer()
    var picTimer = Timer()
    var timerStart: NSDate?
    var picStart: NSDate?
    var jukeBox: AVAudioPlayer?
    var isPlaying = 0
    var timer2 = Timer()
    var photoCount:Int = 0
    
    @IBOutlet var label: UILabel!
    @IBOutlet var viewPic: UIImageView!
    @IBOutlet var viewPic2: UIImageView!
    @IBOutlet var breathe: UILabel!
    
    func playMe(theSong: String){
        let url = URL.init(fileURLWithPath: Bundle.main.path(forResource: theSong, ofType: "mp3")!)
        do {
            try jukeBox = AVAudioPlayer(contentsOf: url)
            jukeBox?.delegate = self
            jukeBox?.prepareToPlay()
        } catch let error as NSError {
            print("audioPlayer error \(error.localizedDescription)")
        }
        if let player = jukeBox {
            player.play()
            player.numberOfLoops = -1
        }
    }
    
    func startAudio(){
        playMe(theSong: "calm")
    }
    
    func startTimer(){
    timer = Timer.scheduledTimer(timeInterval: 1.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    self.timerStart = NSDate()
    }
    
    func unlimTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1.1, target: self, selector: #selector(updateUnlimTimer), userInfo: nil, repeats: true)
        self.timerStart = NSDate()
    }
    
    func startPics(){
        picTimer = Timer.scheduledTimer(timeInterval: 1.1, target: self, selector: #selector(updatePics), userInfo: nil, repeats: true)
        self.picStart = NSDate()
    }
        
    @objc func updateTimer() {
        whichTime -= 1
        if (whichTime >= 0) {
         label.text = "\(whichTime)"
        }
        if (whichTime < 1) {
            timer.invalidate()
            picTimer.invalidate()
            let player = jukeBox
            player?.stop()
            let alert = UIAlertController(title: "Breathing Session Complete", message: "Go back to the menu if you need another session", preferredStyle: UIAlertControllerStyle.alert)
            let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @objc func updateUnlimTimer(){
        whichTime += 1
        label.text = "\(whichTime)"
    }
    
    @objc func updatePics() {
        counter += 1
        if (whichTime != 0) {
            if (counter == 0) {
                viewPic2.image = #imageLiteral(resourceName: "calm1")
                onTransition()
                breathe.text = "Breathe in..."
            } else if (counter == 5) {
                viewPic2.image = #imageLiteral(resourceName: "calm2")
                onTransition()
                breathe.text = "Breathe out..."
            } else if (counter == 10) {
                viewPic2.image = #imageLiteral(resourceName: "calm3")
                onTransition()
                breathe.text = "Breathe in..."
            } else if (counter == 15) {
                viewPic2.image = #imageLiteral(resourceName: "calm4")
                onTransition()
                breathe.text = "Breathe out..."
            } else if (counter == 20) {
                viewPic2.image = #imageLiteral(resourceName: "calm5")
                onTransition()
                breathe.text = "Breathe in..."
            } else if (counter == 25) {
                viewPic2.image = #imageLiteral(resourceName: "calm6")
                onTransition()
                breathe.text = "Breathe out..."
            } else if (counter == 30) {
                viewPic2.image = #imageLiteral(resourceName: "calm7")
                onTransition()
                breathe.text = "Breathe in..."
            } else if (counter == 35) {
                viewPic2.image = #imageLiteral(resourceName: "calm8")
                onTransition()
                breathe.text = "Breathe out..."
            } else if (counter == 40) {
                viewPic2.image = #imageLiteral(resourceName: "calm9")
                onTransition()
                breathe.text = "Breathe in..."
            } else if (counter == 45) {
                viewPic2.image = #imageLiteral(resourceName: "calm10")
                onTransition()
                breathe.text = "Breathe out..."
            } else if (counter == 50) {
                viewPic2.image = #imageLiteral(resourceName: "calm11")
                onTransition()
                breathe.text = "Breathe in..."
            } else if (counter == 55) {
                viewPic2.image = #imageLiteral(resourceName: "calm12")
                onTransition()
                breathe.text = "Breathe out..."
            } else if (counter == 60) {
                viewPic2.image = #imageLiteral(resourceName: "calm13")
                onTransition()
                breathe.text = "Breathe in..."
            } else if (counter == 65) {
                viewPic2.image = #imageLiteral(resourceName: "calm14")
                onTransition()
                breathe.text = "Breathe out..."
            } else if (counter == 70) {
                viewPic2.image = #imageLiteral(resourceName: "calm1")
                onTransition()
                breathe.text = "Breathe in..."
                counter = 0
            }
        }
    }
    
    func onTransition() {
        viewPic.alpha = 1.0
        viewPic.isHidden = false
        UIView.transition(with: viewPic, duration: 1.5, options: UIViewAnimationOptions.transitionCrossDissolve, animations:{
            self.viewPic.isHidden = true
            self.viewPic.alpha = 0.0
        }, completion:nil)
        viewPic2.alpha = 0.0
        viewPic2.isHidden = true
        UIView.transition(with: viewPic2, duration: 1.5, options: UIViewAnimationOptions.transitionCrossDissolve, animations:{
            self.viewPic2.isHidden = false
            self.viewPic2.alpha = 1.0
        }, completion: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let player = jukeBox
        player?.stop()
        timer.invalidate()
        picTimer.invalidate()
        counter = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startAudio()
        viewPic.image = #imageLiteral(resourceName: "calm1")
        label.text = "\(whichTime)"
        if (whichTime == 0) {
            unlimTimer()
        } else {
            startTimer()
        }
        startPics()
        // Do any additional setup after loading the view, typically from a nib.
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
