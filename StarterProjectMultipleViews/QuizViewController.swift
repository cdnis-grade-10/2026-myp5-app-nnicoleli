//
//  QuizViewController.swift
//  StarterProjectMultipleViews
//
//  Created by Nicole on 9/3/2026.
//

import UIKit

class QuizViewController: UIViewController {
    
    // MARK: - IBOutlets
   
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    
    
    //Outlet for buttons
    @IBOutlet weak var optionButton1: UIButton!
    
    @IBOutlet weak var optionButton4: UIButton!
    @IBOutlet weak var optionButton3: UIButton!
    @IBOutlet weak var optionButton2: UIButton!
    // MARK: - Variables and Constants
    var quiz: Quiz!
    
//    var currentIndex = 1
    private var currentQuestionIndex = 0
    private var score = 0
    
    // MARK: - IBActions and Functions
    
    
    
    func displayQuizData() {
//        snakeImageView.image = UIImage(named: snakes[currentIndex].photo)
//        snakeCommonNameLabel.text = snakes[currentIndex].englishCommonName
//        snakeSpeciesNameLabel.text = snakes[currentIndex].speciesName
//        snakeLethalityLabel.text = snakes[currentIndex].lethality.rawValue
        progressLabel.text = "Question \(currentQuestionIndex + 1) of \(quiz.questions.count)"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = quiz.quizTitle
        configureButtons()
        showCurrentQuestion()
        
    
        
    }

    //styling all the buttons with rounded corners and borders
    private func configureButtons() {
          let buttons = [optionButton1, optionButton2, optionButton3, optionButton4]

          for (index, button) in buttons.enumerated() {
              button?.tag = index   // 0,1,2,3 to match options array
              button?.layer.cornerRadius = 8
              button?.layer.borderWidth = 1
              button?.layer.borderColor = UIColor.systemBlue.cgColor
              button?.setTitleColor(.label, for: .normal)
          }
      }

    //main function to display current question + reset buttons
      private func showCurrentQuestion() {
          //if no more questions, show final screen
          guard currentQuestionIndex < quiz.questions.count else {
              showFinalScore()
              return
          }

          let question = quiz.questions[currentQuestionIndex]
          questionLabel.text = question.prompt
          
          //update progress label
          progressLabel.text = "Question \(currentQuestionIndex + 1) of \(quiz.questions.count)"
          
          //set button texts to current question options
          optionButton1.setTitle(question.options[0], for: .normal)
          optionButton2.setTitle(question.options[1], for: .normal)
          optionButton3.setTitle(question.options[2], for: .normal)
          optionButton4.setTitle(question.options[3], for: .normal)

          //enable all the option buttons for user selection
          enableOptionButtons(true)
      }

    // enable/disables option buttons & changes appearance
      private func enableOptionButtons(_ enabled: Bool) {
          [optionButton1, optionButton2, optionButton3, optionButton4].forEach {
              $0?.isEnabled = enabled
              $0?.alpha = enabled ? 1.0 : 0.5
          }
      }
    
    //what happens when the button is tapped
    @IBAction func optionButtonTapped(_ sender: UIButton) {
        let question = quiz.questions[currentQuestionIndex]
        let selectedIndex = sender.tag //which button was tapped
        let isCorrect = (selectedIndex == question.correctIndex)
        //increment if score is correct
        if isCorrect {
            score += 1
        
    }
    
        // Simple immediate feedback via button color
        highlightAnswer(selected: selectedIndex, correctIndex: question.correctIndex)

        // Move to next question after a short delay
        enableOptionButtons(false)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) { [weak self] in
            guard let self = self else { return }
            self.currentQuestionIndex += 1
            self.resetButtonAppearance()
            self.showCurrentQuestion()
        }
    }
    
            private func highlightAnswer(selected: Int, correctIndex: Int) {
                let buttons = [optionButton1, optionButton2, optionButton3, optionButton4]

                for (index, button) in buttons.enumerated() {
                    guard let button = button else { continue }
                    if index == correctIndex {
                        button.backgroundColor = UIColor.systemGreen.withAlphaComponent(0.4)
                    } else if index == selected {
                        button.backgroundColor = UIColor.systemRed.withAlphaComponent(0.4)
                    } else {
                        button.backgroundColor = .clear
                    }
                }
            }

            private func resetButtonAppearance() {
                let buttons = [optionButton1, optionButton2, optionButton3, optionButton4]
                for button in buttons {
                    button?.backgroundColor = .clear
                }
                enableOptionButtons(true)
            }

            private func showFinalScore() {
                let message = "You scored \(score) / \(quiz.questions.count)."

                let alert = UIAlertController(title: "Quiz Finished",
                                              message: message,
                                              preferredStyle: .alert)

                alert.addAction(UIAlertAction(title: "Done", style: .default) { _ in
                    self.navigationController?.popViewController(animated: true)
                })

                alert.addAction(UIAlertAction(title: "Retry", style: .default) { _ in
                    self.currentQuestionIndex = 0
                    self.score = 0
                    self.showCurrentQuestion()
                })

                present(alert, animated: true)
            }
        }

