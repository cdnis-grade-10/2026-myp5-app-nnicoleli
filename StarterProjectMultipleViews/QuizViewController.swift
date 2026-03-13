//
//  QuizViewController.swift
//  StarterProjectMultipleViews
//
//  Created by Nicole on 9/3/2026.
//

import UIKit

class QuizViewController: UIViewController {
    
    // MARK: - IBOutlets
   
    @IBOutlet weak var questionCounterLabel: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var progressBar: UIView!
    
    //Outlet for buttons
    @IBOutlet weak var optionA: UIButton!
    
    @IBOutlet weak var optionD: UIButton!
    @IBOutlet weak var optionC: UIButton!
    @IBOutlet weak var optionB: UIButton!
    // MARK: - Variables and Constants
    

    
    // MARK: - IBActions and Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    }

    @IBAction func answerPressed(_ sender: UIButton) {
        if sender.tag == 1 {
            print("option a")
        }else if sender.tag == 2 {
            print("option b")
        }else if sender.tag == 3 {
            print("option c")
        }else {
            print("option d")
        }
        
    }
    
    
}
