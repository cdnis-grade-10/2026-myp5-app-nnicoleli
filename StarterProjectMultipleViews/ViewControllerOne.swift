/*
 
 ViewControllerOne.swift
 
 This file will contain the code for the first viewcontroller.
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
import AVFoundation //for audio

class ViewControllerOne: UIViewController{
    
    // MARK: - IBOutlets
   
    @IBOutlet weak var healthProgressView: UIProgressView!
    @IBOutlet weak var brainImageView: UIImageView!
    @IBOutlet weak var healthLabel: UILabel!
    
    // MARK: - Variables and Constants
    
    var backgroundMusic: AVAudioPlayer?
    
    
    
    // MARK: - IBActions and Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadQuizData()
        updateBrain()
        playMusic()
    
    }
    
    func playMusic (){
        let path = Bundle.main.path(forResource:"music.mp3", ofType: nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            backgroundMusic = try AVAudioPlayer(contentsOf: url)
            backgroundMusic?.numberOfLoops = -1 //infinite loops
            backgroundMusic?.play()
        } catch {
            // couldn't load file
        }
        
                
    }
    private func updateBrain() {
        let health = Brain.shared.healthPercentage
        
        healthLabel.text = "\(health)%"
        healthProgressView.progress = Float(health) / 100.0
        
        let imageName = Brain.shared.brainImageName()
        brainImageView.image = UIImage(named: imageName)
    }
    
    @IBAction func musicSwitch(_ sender: Any) {
        if ((sender as AnyObject).isOn == true){
            playMusic()
        }else {
            backgroundMusic?.stop()
            }
        }
}

