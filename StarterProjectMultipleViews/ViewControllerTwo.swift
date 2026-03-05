/*
 
 ViewControllerTwo.swift
 
 This file will contain the code for the second viewcontroller.
 Please ensure that your code is organised and is easy to read.
 This means that you will need to both structure your code correctly,
 in addition to using the correct syntax for Swift.
 
 Unless you are told otherwise, ensure that you are using the
 camelCase syntax. For example, outputLabel and firstName are good
 examples of using the camelCase syntax.
 
 Within each class, you can see clearly identified sections denoted by
 MARK statements. These MARK statements allow you to structure and organise
 your code.
 
 - @IBOutlets should be listed under the MARK section on IBOutlets
 - Variables and constants listed under the MARK section Variables and Constants
 - Functions (including @IBActions) listed under the section on IBActions and Functions.
 
 As you develop each view controller class with Swift code, please include
 detailed comments to both demonstrate understanding, and which serve you as
 a reminder as to what your code actually does.
 
 */

import UIKit

class ViewControllerTwo: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var startPauseButton: UIButton!
    
    @IBOutlet weak var endButton: UIButton!
    
    // MARK: - Variables and Constants
    var timer:Timer = Timer()
    var count:Int = 0
    var timerCounting:Bool = false
    
    
    
    // MARK: - IBActions and Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startPauseButton.setTitleColor(UIColor.green, for: .normal)
        
    }

    
    
    @IBAction func endTapped(_ sender: Any) {
        
        
    }
    
    @IBAction func startPauseTapped(_ sender: Any) {
        if(timerCounting){
          timerCounting = false
            timer.invalidate()
            startPauseButton.setTitle("START", for: .normal)
            startPauseButton.setTitleColor(UIColor.green, for: .normal)
        }else{
            timerCounting = true
            startPauseButton.setTitle("PAUSE", for: .normal)
            startPauseButton.setTitleColor(UIColor.red, for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 1,target:self, selector:#selector(timerCounter), userInfo: nil, repeats: true)
        }
    }
    
    @objc func timerCounter() -> Void {
        count = count + 1
        let time = secondsToHoursMinutesSeconds(seconds: count)
        let timeString = makeTimeString(hours: time.0, minutes: time0.1, seconds: time0.2)
        timerLabel.text = timeString
    }
    
    func secondsToHoursMinutesSeconds(seconds: Int) -> (Int, Int, Int){
        return((seconds / 3600), (seconds % 3600)/60, (seconds % 3600) % 60)
    }
    
    func makeTimeString(hours: Int, minutes: Int, seconds: Int) -> String
    {
        
        var timeString = ""
        timeString += String(format:"0%2d", hours)
        timeString += " : "
        timeString += String(format:"0%2d", minutes)
        timeString += " : "
        timeString += String(format:"0%2d", seconds)
        return timeString
    }
}
