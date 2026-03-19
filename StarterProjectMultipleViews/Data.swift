//
//  Data.swift
//  StarterProjectMultipleViews
//
//  Created by Nicole on 11/3/2026.
//

import UIKit

struct QuizQuestion {
    let prompt: String
    let options: [String]
    let correctIndex: Int
}

struct Quiz {
    let id: String
    let quizTitle: String
    let quizDescription: String
    let quizCoverImage: UIImage?
    let questions: [QuizQuestion]
}

var allQuizzes = [Quiz]()

func loadQuizData() {
    allQuizzes = [
        Quiz(
            id: "bio-enzymes",
            quizTitle: "Enzymes Basics",
            quizDescription: "Test your knowledge of enzyme structure and function.",
            quizCoverImage: UIImage(named: "enzymesCover"),
            questions: [
                QuizQuestion(
                    prompt: "What is the active site of an enzyme?",
                    options: [
                        "The region where substrate binds",
                        "The part that denatures first",
                        "The entire protein surface",
                        "The non-protein part of the enzyme"
                    ],
                    correctIndex: 0
                ),
                QuizQuestion(
                    prompt: "Which factor does NOT affect enzyme activity?",
                    options: [
                        "Temperature",
                        "pH",
                        "Substrate concentration",
                        "Planet alignment"
                    ],
                    correctIndex: 3
                ),
                QuizQuestion(
                    prompt: "Enzymes speed up reactions by:",
                    options: [
                        "Raising activation energy",
                        "Lowering activation energy",
                        "Adding more reactants",
                        "Making products more stable"
                    ],
                    correctIndex: 1
                ),
                QuizQuestion(
                    prompt: "Most enzymes are:",
                    options: [
                        "Lipids",
                        "Carbohydrates",
                        "Proteins",
                        "Nucleic acids"
                    ],
                    correctIndex: 2
                ),
                QuizQuestion(
                    prompt: "Which term describes loss of enzyme structure?",
                    options: [
                        "Hydrolysis",
                        "Denaturation",
                        "Polymerization",
                        "Condensation"
                    ],
                    correctIndex: 1
                ),
                QuizQuestion(
                    prompt: "At very high temperatures, enzyme activity usually:",
                    options: [
                        "Increases forever",
                        "Stays constant",
                        "Drops sharply",
                        "Becomes negative"
                    ],
                    correctIndex: 2
                ),
                QuizQuestion(
                    prompt: "The substrate is:",
                    options: [
                        "The product of a reaction",
                        "The molecule an enzyme acts on",
                        "The enzyme's cofactor",
                        "The enzyme's inhibitor"
                    ],
                    correctIndex: 1
                ),
                QuizQuestion(
                    prompt: "A competitive inhibitor:",
                    options: [
                        "Binds at the active site",
                        "Destroys the enzyme",
                        "Binds only to products",
                        "Changes the pH of solution"
                    ],
                    correctIndex: 0
                ),
                QuizQuestion(
                    prompt: "Enzymes are specific because:",
                    options: [
                        "They are very large",
                        "They are made only of carbon",
                        "Their active site fits only certain substrates",
                        "They cannot be reused"
                    ],
                    correctIndex: 2
                ),
                QuizQuestion(
                    prompt: "Which statement about enzymes is true?",
                    options: [
                        "They are used up in reactions",
                        "They can be reused many times",
                        "They make reactions non-spontaneous",
                        "They always require light"
                    ],
                    correctIndex: 1
                )
            ]
        ),
        Quiz(
            id: "study-techniques",
            quizTitle: "Study Techniques",
            quizDescription: "Quick quiz on effective study methods.",
            quizCoverImage: UIImage(named: "studyCover"),
            questions: [
                QuizQuestion(
                    prompt: "Which technique is most effective for long-term retention?",
                    options: [
                        "Rereading notes once",
                        "Massed practice (cramming)",
                        "Spaced repetition",
                        "Highlighting everything"
                    ],
                    correctIndex: 2
                ),
                QuizQuestion(
                    prompt: "Which is an example of active recall?",
                    options: [
                        "Listening to a lecture",
                        "Copying notes neatly",
                        "Testing yourself without notes",
                        "Organizing your desk"
                    ],
                    correctIndex: 2
                ),
                QuizQuestion(
                    prompt: "Pomodoro technique usually means:",
                    options: [
                        "25 minutes focus, 5 minutes break",
                        "2 hours focus, 10 minutes break",
                        "Study only in the morning",
                        "Study with background TV"
                    ],
                    correctIndex: 0
                ),
                QuizQuestion(
                    prompt: "Interleaving means:",
                    options: [
                        "Studying only one subject all day",
                        "Switching between different topics",
                        "Studying without breaks",
                        "Using only flashcards"
                    ],
                    correctIndex: 1
                ),
                QuizQuestion(
                    prompt: "Which environment is best for focused work?",
                    options: [
                        "Noisy cafeteria",
                        "Bed with phone nearby",
                        "Quiet desk with minimal distractions",
                        "Crowded bus"
                    ],
                    correctIndex: 2
                ),
                QuizQuestion(
                    prompt: "What should you do after a class to improve learning?",
                    options: [
                        "Forget about it immediately",
                        "Quickly review and summarize key points",
                        "Delete all notes",
                        "Change all subjects"
                    ],
                    correctIndex: 1
                ),
                QuizQuestion(
                    prompt: "Which strategy helps avoid procrastination?",
                    options: [
                        "Setting vague goals",
                        "Waiting to feel motivated",
                        "Breaking tasks into very small steps",
                        "Doing everything at once"
                    ],
                    correctIndex: 2
                ),
                QuizQuestion(
                    prompt: "Sleep is important because it:",
                    options: [
                        "Erases memories",
                        "Consolidates learning",
                        "Only rests muscles",
                        "Replaces studying"
                    ],
                    correctIndex: 1
                ),
                QuizQuestion(
                    prompt: "Which note-taking method encourages processing ideas?",
                    options: [
                        "Mind maps or Cornell notes",
                        "Copy-paste slides",
                        "Taking photos of the board only",
                        "No notes at all"
                    ],
                    correctIndex: 0
                ),
                QuizQuestion(
                    prompt: "Right before an exam, you should mainly:",
                    options: [
                        "Learn new topics from scratch",
                        "Try a few practice questions",
                        "Pull an all-nighter",
                        "Change your entire schedule"
                    ],
                    correctIndex: 1
                )
            ]
        )
    ]
}


