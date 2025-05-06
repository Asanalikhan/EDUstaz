//
//  Olympiad.swift
//  Edustaz DEMO
//
//  Created by Yernur Adilbek on 4/9/25.
//

struct Olympiad {
    public var imageView: String
    public var title: String
    public var month: String
    
    init(imageView: String, title: String, month: String) {
        self.imageView = imageView
        self.title = title
        self.month = month
    }
    
    static let olympiadsData: [Olympiad] = [Olympiad(imageView: "history", title: "Тарих", month: "Маусым"),
                                             Olympiad(imageView: "naturalScience", title: "Жаратылыстану", month: "Маусым"),
                                             Olympiad(imageView: "geography", title: "География", month: "Маусым"),
                                             Olympiad(imageView: "compScience", title: "Иформатика", month: "Маусым"),
                                             Olympiad(imageView: "biology", title: "Биология", month: "Маусым"),
                                             Olympiad(imageView: "physics", title: "Физика", month: "Маусым"),
                                             Olympiad(imageView: "elementary", title: "Бастауыш сынып", month: "Маусым"),
                                             Olympiad(imageView: "musics", title: "Музыка", month: "Маусым"),
                                             Olympiad(imageView: "psychology", title: "Психология", month: "Маусым"),
                                             Olympiad(imageView: "pe", title: "Дене шынықтыру", month: "Маусым"),
                                             Olympiad(imageView: "kazakh", title: "Қазақ тілі", month: "Маусым"),
                                             Olympiad(imageView: "russian", title: "Орыс тілі", month: "Маусым"),
                                             Olympiad(imageView: "military", title: "Әскери дайындық", month: "Маусым"),
                                             Olympiad(imageView: "pedagogy", title: "Педагогика", month: "Маусым"),
                                             Olympiad(imageView: "rights", title: "Құқық", month: "Маусым"),
                                            Olympiad(imageView: "", title: "Математика", month: "Маусым"),
                                            Olympiad(imageView: "", title: "Химия", month: "Маусым"),
                                            Olympiad(imageView: "", title: "Тексеру", month: "Маусым")]
        
}
