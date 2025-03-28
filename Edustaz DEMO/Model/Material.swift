//
//  Material.swift
//  Edustaz DEMO
//
//  Created by Yernur Adilbek on 3/26/25.
//

class Material{
    public var title: String = ""
    public var type: String = ""
    public var grade: Int = 0
    public var subject: String = ""
    
    init(title: String, type: String, grade: Int, subject: String) {
        self.title = title
        self.type = type
        self.grade = grade
        self.subject = subject
    }
}
