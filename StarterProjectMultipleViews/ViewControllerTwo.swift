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

    //tracks the minutes studied
    private func studiedMinutes() -> Int {
        return count / 60
    }
    
    
    @IBAction func endTapped(_ sender: Any) { //Codes for what will happen when the end button is tapped
        
        /* sends an alert, asking the user if they want to end sessoin
         user can select cancel, or yes */
        let alert = UIAlertController(title: "End session?", message: "Are you sure you would like to end session?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "CANCEL", style: .cancel, handler: { (_) in
            //do nothing
        }))
        alert.addAction(UIAlertAction(title: "YES", style: .default, handler: { (_) in
            
            
            //capture the study time
            let minutes = self.studiedMinutes()
            //show popup
            self.presentCreditsPopupForStudy(minutes: minutes)
            
            // if user selected yes, then reset the timer to its original state
            self.count = 0
            self.timer.invalidate()
            self.timerLabel.text = self.makeTimeString(hours: 0, minutes: 0, seconds: 0)
            self.startPauseButton.setTitle("START", for: .normal)
            self.startPauseButton.setTitleColor(UIColor.green, for: .normal)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    //what happens when the start button is tapped
    @IBAction func startPauseTapped(_ sender: Any) {
        // user can pause and start the time4r
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
        let timeString = makeTimeString(hours: time.0, minutes: time.1, seconds: time.2)
        timerLabel.text = timeString
    }
    
    func secondsToHoursMinutesSeconds(seconds: Int) -> (Int, Int, Int){
        // turns the really big seconds string into seconds, minutes, and hours
        return((seconds / 3600), (seconds % 3600)/60, (seconds % 3600) % 60)
    }
    
    func makeTimeString(hours: Int, minutes: Int, seconds: Int) -> String
    {
        
        var timeString = ""
        timeString += String(format:"%02d", hours)
        timeString += " : "
        timeString += String(format:"%02d", minutes)
        timeString += " : "
        timeString += String(format:"%02d", seconds)
        return timeString
    }
    
    //goes to the popup view controller to display feedback
    private func presentCreditsPopupForStudy(minutes: Int) {
        let popup = storyboard?.instantiateViewController(
            withIdentifier: "CreditsPopupViewController"
        ) as! CreditsPopupViewController
        
        popup.creditsEarned = minutes
        popup.summaryText = "You studied for \(minutes) minute\(minutes == 1 ? "" : "s")."
        
        popup.modalPresentationStyle = .overCurrentContext
        popup.modalTransitionStyle = .crossDissolve
        
        self.present(popup, animated: true, completion: nil)
    }
}
