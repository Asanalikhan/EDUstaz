//
//  Question.swift
//  Edustaz DEMO
//
//  Created by Yernur Adilbek on 4/27/25.
//

import Foundation

struct Question {
    let text: String
    let options: [String]
    let answer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        self.text = q
        self.options = a
        self.answer = correctAnswer
    }
}
