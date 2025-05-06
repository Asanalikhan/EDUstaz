//
//  Material.swift
//  Edustaz DEMO
//
//  Created by Yernur Adilbek on 3/26/25.
//

struct Material: Codable{
    
    
    static var materialsData: [Material] = [Material(title: "Қазақстанның климат түзуші факторлары", subtitle: "География және Жаратылыстану 9 сынып Қазақстанның климат түзуші факторлары", author: "Айтмұратов Арман", type: "Ашық сабақ", grade: 9, subject: "География", downloadCount: 0, viewCount: 21),
                                            Material(title: "Қабдеш Жұмаділов \"Тағды\" романы", subtitle: "Қабдеш Жұмаділовтің «Тағдыр» романы — қазақ халқының Қытайдағы тағдыры туралы жазылған тарихи шығарма. Роман ХХ ғасырдың басындағы Шығыс Түркістандағы қазақтардың ауыр тұрмысын, ұлттық езгіні, екі ел арасында босып жүрген халықтың қиын тағдырын баяндайды.", author: "Смаилова Гульвира", type: "Ашық сабақ", grade: 10, subject: "Қазақ тілі", downloadCount: 0, viewCount: 70),
                                            Material(title: "Python тілінде программалау", subtitle: "Python тілінде алгоритмдік программалау бөлімі бойынша жиынтық бағалау", author: "Максутова Шынар", type: "Ашық сабақ", grade: 8, subject: "Информатика", downloadCount: 0, viewCount: 49),
                                            Material(title: "ҚМЖ.Мен жазбаймын өлеңді ермек үшін.Абай Құнанбаев", subtitle: "Абай Құнанбаев.Мен жазбаймын өлеңді ермек үшін жасалған сабақ жоспары", author: "Тұрсын Талғар", type: "Презентация", grade: 6, subject: "Қазақ тілі", downloadCount: 0, viewCount: 95),
                                            Material(title: "Электр тогының жылулық әсері. Джоуль-Ленц заңы.", subtitle: "Физика 8 сынып Электр тогының жылулық әсері. Джоуль-Ленц заңы.", author: "Сейитмуратова Эльвира", type: "Презентация", grade: 8, subject: "Физика", downloadCount: 0, viewCount: 51)
    ]
    
    public var title: String = ""
    public var subtitle: String = ""
    public var author: String = ""
    public var type: String = ""
    public var grade: Int = 0
    public var subject: String = ""
    public var downloadCount: Int = 0
    public var viewCount: Int = 0
    
    init(title: String, subtitle: String, author: String, type: String, grade: Int, subject: String, downloadCount: Int, viewCount: Int) {
        self.title = title
        self.subtitle = subtitle
        self.author = author
        self.type = type
        self.grade = grade
        self.subject = subject
        self.downloadCount = downloadCount
        self.viewCount = viewCount
    }
}
