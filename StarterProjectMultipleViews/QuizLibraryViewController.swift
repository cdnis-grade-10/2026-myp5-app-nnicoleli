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
    /* to track if the quiz data has loaded
     prevent reloading data*/
    private var hasLoadedData = false
    
    // MARK: - IBActions and Functions
    //To ensure the data is only loaded once
    func loadQuizDataIfNeeded () {
        if !hasLoadedData {
                    loadQuizData()
            hasLoadedData = true
            // Refresh table to show quizzes.
                        tableView.reloadData()
                    }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allQuizzes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuizCell", for: indexPath) as! AllQuizzesTableViewCell
        
        //getting quiz data ready
        let quiz = allQuizzes[indexPath.row]
        
        //configure custom cell's outlets
        cell.quizTitleLabel.text = quiz.quizTitle
        cell.quizDescriptionLabel.text = quiz.quizDescription
        cell.quizImageView.image = quiz.quizCoverImage
        
        //makes image fill image view nicely
        cell.quizImageView.contentMode = .scaleAspectFill
        cell.quizImageView.clipsToBounds = true
        return cell
    }
    
    //handles what happens when the user taps a row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Tap works")
        //deselect the row so it doesn't stay highlighted
            tableView.deselectRow(at: indexPath, animated: true)
            
            if let quizVC = storyboard?.instantiateViewController(withIdentifier: "QuizViewController") as? QuizViewController {
                quizVC.quiz = allQuizzes[indexPath.row]
                navigationController?.pushViewController(quizVC, animated: true)
            }
        
    }
    

    // perpares QuizViewController before segue happens
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowQuiz",
           let quizVC = segue.destination as? QuizViewController,
           let indexPath = tableView.indexPathForSelectedRow {
            let selectedQuiz = allQuizzes[indexPath.row]
            quizVC.quiz = selectedQuiz

        }
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //registers the custom cell
//        let nib = UINib(nibName: "AllQuizzesTableViewCell", bundle: nil) // 1. calling CustomTableViewCell.xib
//          self.tableView.register(nib, forCellReuseIdentifier: "QuizCell") // 2. register to the NewTableView
//        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 100  //space for image + text
    loadQuizDataIfNeeded()
        tableView.register(UINib(nibName: "AllQuizzesTableViewCell", bundle: nil),
                                 forCellReuseIdentifier: "QuizCell")
               tableView.reloadData()

    }

}
