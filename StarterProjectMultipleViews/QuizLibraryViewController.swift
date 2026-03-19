//
//  QuizLibraryViewController.swift
//  StarterProjectMultipleViews
//
//  Created by Nicole on 11/3/2026.
//

import UIKit

class QuizLibraryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - Variables and Constants
    
    
    // MARK: - IBActions and Functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allQuizzes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuizCell", for: indexPath)
        cell.textLabel?.text = allQuizzes[indexPath.row].quizTitle
        cell.detailTextLabel?.text = allQuizzes[indexPath.row].quizDescription
        cell.imageView?.image = allQuizzes[indexPath.row].quizCoverImage
        return cell
    }
    
    private func registerTableViewCells(){
        let textFieldCell = UINib(nibName: "AllQuizesTableViewCell",
                                     bundle: nil)
           self.tableView.register(textFieldCell,
                                   forCellReuseIdentifier: "AllQuizzesTableViewCell")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowQuiz",
           let quizVC = segue.destination as? QuizViewController,
           let indexPath = tableView.indexPathForSelectedRow {
            let selectedQuiz = allQuizzes[indexPath.row]
            quizVC.quiz = selectedQuiz

        }
    }
    
    //    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //        let cell = tableView.dequeueReusableCell(withIdentifier: "QuizCell", for: indexPath)
    //
    //        let quiz = allQuizzes[indexPath.row]
    //        cell.textLabel?.text = quiz.quizTitle
    //        cell.detailTextLabel?.text = quiz.quizDescription
    //        cell.imageView?.image = quiz.quizCoverImage
    //        cell.imageView?.contentMode = .scaleAspectFill
    //
    //        return cell
    //    }
    //}
    //
    //extension QuizLibraryViewController: UITableViewDelegate {
    //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        tableView.deselectRow(at: indexPath, animated: true)
    //    }
    //}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "AllQuizzesTableViewCell", bundle: nil) // 1. calling CustomTableViewCell.xib
          self.tableView.register(nib, forCellReuseIdentifier: "QuizCell") // 2. register to the NewTableView
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 100  //space for image + text
    
    }
}
