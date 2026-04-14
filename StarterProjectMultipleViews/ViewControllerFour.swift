//
//  ViewControllerFour.swift
//  StarterProjectMultipleViews
//
//  Created by Nicole on 7/3/2026.
//

import UIKit

class ViewControllerFour: UIViewController {

    
    // MARK: - IBOutlets
    @IBOutlet var titleField: UITextField!
    @IBOutlet var noteField: UITextView!
    
    
    
    // MARK: - Variables and Constants
    
    // a function that returns a string and a string
    public var completion: ((String, String) -> Void)?
    
    
    // MARK: - IBActions and Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        titleField.becomeFirstResponder() //the keyboard
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSave)) //save button
    
    }
    @objc func didTapSave() {
        if let text = titleField.text, !text.isEmpty, !noteField.text.isEmpty{
            completion?(text, noteField.text)
        }
    }
   
    
}
