//
//  Data.swift
//  StarterProjectMultipleViews
//
//  Created by Nicole on 11/3/2026.
//

import Foundation


struct Quiz {
    let id = UUID()
    let quizTitle: String
    let quizCoverImage: String
    
}


struct QuizQuestion {
    let questionText: String
    let questionImageName: String
    let numberOfQuestions: Int
    let optionA: String
    let optionB: String
    let optionC: String
    let optionD: String
    let correctAnswer: Int

    
    
    
}

struct QuizResult {
    let answeredCourrectly: Int
    let numberOfQuestions: Int
    
}

struct StudyTimer {
    let studyDuration: Int
    let minutesStudied: Int
    let timerIsRunning: Bool
}

struct BrainState {
    let healthPercentage: Int
    let brainStateImage: String
}

struct ActivityFeedback {
    let activityType: String
    let creditsEarned: Int
}

//class Question {
//    let questionImage: String
//    let question: String
//    let optionA: String
//    let optionB: String
//    let optionC: String
//    let optionD: String
//    let correctAnswer: Int
//    
//    init(image: String, questionText: String, choiceA: String, choiceB: String, choiceC: String, choiceD: String, answer: Int)
//    
//    questionImage = image
//    question = questionText
//    optionA = choiceA
//    optionB = choiceB
//    optionC = choiceC
//    optionD = choiceD
//    correctAnswer = answer
//    
//}

