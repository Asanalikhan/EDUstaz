//
//  Notification.swift
//  Edustaz DEMO
//
//  Created by Yernur Adilbek on 4/17/25.
//

struct MyNotification {
    var title: String = ""
    var subtitle: String = ""
    var time: String = ""
    
    init(title: String, subtitle: String, time: String) {
        self.title = title
        self.subtitle = subtitle
        self.time = time
    }
}
