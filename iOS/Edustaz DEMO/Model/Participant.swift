//
//  Participant.swift
//  Edustaz DEMO
//
//  Created by Yernur Adilbek on 4/24/25.
//

struct Participant: Codable {
    let name: String
    let code: String
    let subject: String
    
    init(name: String, code: String, subject: String) {
        self.name = name
        self.code = code
        self.subject = subject
    }
}
