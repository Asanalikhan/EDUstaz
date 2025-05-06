//
//  TestBrain.swift
//  Edustaz DEMO
//
//  Created by Yernur Adilbek on 4/27/25.
//

import Foundation

struct TestBrain {
    private(set) var quiz: [Question] = []
    private(set) var subject: Subject
    private(set) var testType: TestType
    
    var questionNumber = 0
    var score = 0
    
    init(subject: Subject, testType: TestType) {
        self.subject = subject
        self.testType = testType
        loadQuestions()
    }
    
    mutating func loadQuestions() {
        let allQuestions = QuestionBank.shared.getQuestions(for: subject)
//        let count = testType == .olympiad ? 30 : 50
//        self.quiz = Array(allQuestions.shuffled().prefix(count))
        switch testType {
        case .olympiad:
            self.quiz = Array(allQuestions.prefix(30).shuffled())
        case .attestation:
            self.quiz = Array(allQuestions.dropFirst(30).shuffled())
        }
    }
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool{
        if userAnswer == quiz[questionNumber].answer {
            score += 1
            return true
        } else{
            return false
        }
    }
    
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    mutating func nextQuession() {
        if questionNumber < quiz.count - 1 {
            questionNumber += 1

        } else {
            questionNumber = 0
            score = 0
        }
    }
    
    func getScore() -> Int{
        return score
    }
    
    func getOptionTitle(option: Int) -> String {
        return quiz[questionNumber].options[option]
    }
    
    mutating func reset() {
        questionNumber = 0
        score = 0
    }

}
