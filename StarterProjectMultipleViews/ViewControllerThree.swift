/*
 
 ViewControllerThree.swift
 
 This file will contain the code for the third viewcontroller.
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

class ViewControllerThree: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    // MARK: - IBOutlets
    @IBOutlet var table: UITableView!
    
    
    // MARK: - Variables and Constants
    //array of tuples
    //var models: [(title: String, note: String)] = []
    
    var models: [Note] = []
    
    // MARK: - IBActions and Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        table.delegate = self
        table.dataSource = self
        title = "Notes"
        self.table.isHidden = false
        setupPreMadeNotes()
        
    }
    
    private func setupPreMadeNotes() {
        models = preMadeNotes
        table.reloadData()
    }
    
    @IBAction func didTapNewNote() {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "new") as? ViewControllerFour else {
            return
        }
        vc.title = "New Note"
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.completion = { noteTitle, note in
            self.navigationController?.popToRootViewController(animated: true)
            self.models.append(Note(title: noteTitle, body: note))
            self.table.reloadData()
        }
        navigationController?.pushViewController(vc, animated: true)
    }

    //Table stuff
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row].title
        cell.detailTextLabel?.text = models[indexPath.row].body
        
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 12)
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        let model = models[indexPath.row]
        //Show note controller
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "note")as? ViewControllerFive else {
            return
        }
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.title = "Note"
        vc.noteTitle = model.title
        vc.note = model.body
        navigationController?.pushViewController(vc, animated: true)
    }
}
