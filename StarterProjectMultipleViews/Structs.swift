//
//  Structs.swift
//  StarterProjectMultipleViews
//
//  Created by Nicole on 11/3/2026.
//

import Foundation

struct QuizQuestion {
    let questionText: String
    let questionImageName: String
    let questionNumber: Int
    let numberOfQuestions: Int
    let isAnsweredCorrectly: Bool
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
