//
//  ViewControllerFive.swift
//  StarterProjectMultipleViews
//
//  Created by Nicole on 7/3/2026.
//

import UIKit

class ViewControllerFive: UIViewController {
    
    // MARK: - IBOutlets
   
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var noteLabel: UITextView!
    
    // MARK: - Variables and Constants
    public var noteTitle: String = ""
    public var note: String = ""

    
    // MARK: - IBActions and Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        titleLabel.text = noteTitle
        noteLabel.text = note
    }
    
   
    
}
