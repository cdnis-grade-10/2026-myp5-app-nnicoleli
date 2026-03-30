//
//  CreditsPopupViewController.swift
//  StarterProjectMultipleViews
//
//  Created by Nicole on 26/3/2026.
//

import UIKit

class CreditsPopupViewController: UIViewController {
    // MARK: - IBOutlets
    
    @IBOutlet weak var feedbackContainerView: UIView!
    
    @IBOutlet weak var feedbackTitleLabel: UILabel!
    
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var feedbackDetailLabel: UILabel!
    
    // MARK: - Variables and Constants

    var creditsEarned: Int = 0
    var summaryText: String = ""
    
    // MARK: - IBActions and Functions

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //dim the background behind popup
        view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        
        //style popup view
        feedbackContainerView.layer.cornerRadius = 16
        feedbackContainerView.clipsToBounds = true
        
        //configure labels
        feedbackTitleLabel.text = "Congrats!"
        feedbackDetailLabel.text = "\(summaryText) You earned \(creditsEarned) credits!"
        
        //update brain credits
        Brain.shared.addCredits(creditsEarned)
    }
    
    
    @IBAction func homeButtonTapped(_ sender: Any) {
        
        //dissmiss the popup
        dismiss(animated: true)
        
        //go back to home screen
        self.navigationController?.popToRootViewController(animated:true)
    }
    
    
}
