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
    private var quizzes: [Quiz] = QuizData.allQuizzes

    
    // MARK: - IBActions and Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Quizzes"
               
               tableView.dataSource = self
               tableView.delegate = self
               tableView.rowHeight = 80  // gives space for image + text
        // Do any additional setup after loading the view.
    
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowQuiz",
           let quizVC = segue.destination as? QuizViewController,
           let indexPath = tableView.indexPathForSelectedRow {
            let selectedQuiz = quizzes[indexPath.row]
            quizVC.quiz = selectedQuiz
        }
    }
}

extension QuizLibraryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizzes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuizCell", for: indexPath)
        
        let quiz = quizzes[indexPath.row]
        cell.textLabel?.text = quiz.quizTitle
        cell.detailTextLabel?.text = quiz.quizDescription
        cell.imageView?.image = quiz.quizCoverImage
        cell.imageView?.contentMode = .scaleAspectFill
        
        return cell
    }
}

extension QuizLibraryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

