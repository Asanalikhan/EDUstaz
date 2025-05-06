//
//  Subject.swift
//  Edustaz DEMO
//
//  Created by Yernur Adilbek on 5/4/25.
//

enum Subject: String, CaseIterable {
    case kzHistory
    case math
    case natScience
    case english
    case geography
    case informatika
    case biology
    case kazakh
    case pe
    case music
    case worldHistory
    case physics
    case work
    case chemistry
    case psychology
    case russian
    case pedagogy
    case check
    
    
    // Add the rest of the 18 subjects
}

extension Subject {
    static func from(kazakhTitle: String) -> Subject? {
        let mapping: [String: Subject] = [
            "тарих": .kzHistory,
            "математика": .math,
            "жаратылыстану": .natScience,
            "ағылшын тілі": .english,
            "география": .geography,
            "информатика": .informatika,
            "биология": .biology,
            "қазақ тілі": .kazakh,
            "дене шынықтыру": .pe,
            "музыка": .music,
            "дүниежүзі тарихы": .worldHistory,
            "физика": .physics,
            "еңбек": .work,
            "химия": .chemistry,
            "психология": .psychology,
            "орыс тілі": .russian,
            "педагогика": .pedagogy,
            "тексеру": .check
        ]
        
        return mapping[kazakhTitle.lowercased()]
    }
}
