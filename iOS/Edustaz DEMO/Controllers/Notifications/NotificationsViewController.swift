//
//  NotificationsViewController.swift
//  Edustaz DEMO
//
//  Created by Yernur Adilbek on 4/17/25.
//

import UIKit

class NotificationsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.register(NotificationsTableViewCell.self, forCellReuseIdentifier: NotificationsTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    let notifications: [MyNotification] = [
        MyNotification(
            title: "Олимпиада басталды!",
            subtitle: "Математика пәні бойынша олимпиада басталды. Қатысып, өз біліміңді көрсетіп үлгер!",
            time: "10:00"
        ),
        MyNotification(
            title: "Жаңа материал",
            subtitle: "Мұғалім «Алгоритмдер» тақырыбы бойынша жаңа бейнесабақ пен слайдтарды жариялады. Танысып шық!",
            time: "11:30"
        ),
        MyNotification(
            title: "Курс бойынша еске салу",
            subtitle: "«ҰБТ-ға дайындық» курсының қалған бөлімдерін аяқтауды ұмытпа. Маңызды материалдар бар.",
            time: "14:15"
        ),
        MyNotification(
            title: "Аттестация жақындап қалды!",
            subtitle: "Қорытынды аттестация ертең өтеді. Кестені тексеріп, дайындалып ал.",
            time: "18:45"
        )
    ]


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.97, green: 0.96, blue: 0.96, alpha: 1.00)
        
        title = "Хабарландыру"
        setupUI()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notifications.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NotificationsTableViewCell.identifier, for: indexPath) as! NotificationsTableViewCell
        
        cell.configure(with: notifications[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}


// MARK: - Setting UI Methods
private extension NotificationsViewController {
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.bottom.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview().inset(15)
        }
    }
}

