//
//  ViewController.swift
//  cooktimer
//
//  Created by Juneja, Vanuj on 2/8/16.
//  Copyright © 2016 Juneja, Vanuj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timeSeconds = 0
    var clockRunning = false
    var timer = NSTimer()
    var whistleCount = 0
    
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var whistles: UILabel!
    
    @IBOutlet weak var startStopButton: UIButton!
    
    func increment() {
        timeSeconds += 1
        time.text = "\(timeSeconds)"
    }
    
    @IBAction func startStop(sender: UIButton) {
        if clockRunning == false {
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("increment"), userInfo: nil, repeats: true)
            clockRunning = true
            startStopButton.setTitle("Stop", forState: UIControlState.Normal)
        } else {
            timer.invalidate();
            clockRunning = false
            startStopButton.setTitle("Start", forState: UIControlState.Normal)
        }
    }
    
    @IBAction func reset(sender: UIButton) {
        timeSeconds = 0
        clockRunning = false
        timer.invalidate()
        whistleCount = 0
        time.text = "0"
        whistles.text = "0"
        startStopButton.setTitle("Start", forState: UIControlState.Normal)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

