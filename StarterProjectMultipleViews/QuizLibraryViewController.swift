//
//  QuizLibraryViewController.swift
//  StarterProjectMultipleViews
//
//  Created by Nicole on 11/3/2026.
//

import UIKit

class QuizLibraryViewController: UIViewController {
    
    // MARK: - IBOutlets
   
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - Variables and Constants
    let data = ["Cell Biology", "Atomic Structure", "Bonding"]

    
    // MARK: - IBActions and Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        // Do any additional setup after loading the view.
    
    }
    
    
}

extension QuizLibraryViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "identifier")
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

/* In viewDidLoad, we are setting the dataSource of the table view as self. It indicates that the current viewcontroller is responsible for the data of the tableview, i.e. it will decide how many rows to load, how many sections this table view has and what cell we need to load for a specific row.
 The extension of ViewController is used as UITableViewDataSource. Here, we have three methods implemented.
 numberOfRowsInSection returns how many rows we are shwing in the tableView. It is same as the number of items we have in the array data
 numberOfSections returns the number of sections for the table view. It is 1 for this example.
 cellForRowAt is used to return one table view cell. We are creating one object of UITableViewCell and returning its value. We can also load custom classes with different UIs in the table view cell.*/

