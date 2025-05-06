//
//  OlympiadAddParticipantView.swift
//  Edustaz DEMO
//
//  Created by Yernur Adilbek on 4/11/25.
//

import UIKit

class OlympiadAddParticipantView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    var onAddParticipantTapped: (() -> Void)?
    var selectedOlympiad: Olympiad
    static var participantsPerOlympiad: [String: [Participant]] = [:]
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Қатысушылар"
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        label.textColor = UIColor(red: 0.28, green: 0.25, blue: 0.88, alpha: 1.00)
        return label
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Қатысушы аты-жөнін жазыңыз"
        textField.font = UIFont.systemFont(ofSize: 10, weight: .medium)
        textField.textColor = .black
        textField.layer.cornerRadius = 10
        textField.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.00)
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        textField.leftViewMode = .always
        return textField
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Сақтау", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font =  UIFont.systemFont(ofSize: 10, weight: .regular)
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor(red: 0.16, green: 0.53, blue: 0.20, alpha: 1.00)
        button.addTarget(self, action: #selector(savePressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Болдырмау", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font =  UIFont.systemFont(ofSize: 10, weight: .regular)
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor(red: 1.00, green: 0.37, blue: 0.37, alpha: 1.00)
        button.addTarget(self, action: #selector(addParticipantTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "simpleCell")
        return tableView
    }()
    
    private lazy var enterCodeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Код еңгізу", for: .normal)
        button.titleLabel?.font =  UIFont.systemFont(ofSize: 13, weight: .regular)
        button.backgroundColor = UIColor(red: 0.28, green: 0.25, blue: 0.88, alpha: 1.00)
        button.layer.cornerRadius = 10
        return button
    }()
    
    var participants: [Participant] = []
    

    init(selectedOlympiad: Olympiad) {
        self.selectedOlympiad = selectedOlympiad
        super.init(frame: .zero)
        backgroundColor = .clear
        layer.borderColor = UIColor(red: 0.28, green: 0.25, blue: 0.88, alpha: 1.00).cgColor
        layer.borderWidth = 0.5
        layer.cornerRadius = 10
        setupUI()
        
        OlympiadAddParticipantView.participantsPerOlympiad = OlympiadAddParticipantView.loadParticipantsFromUserDefaults()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc private func addParticipantTapped() {
        onAddParticipantTapped?()
    }
    
    @objc func savePressed() {
        guard let name = textField.text, !name.isEmpty else { return }
        
        var newCode: String
        repeat {
            newCode = String(format: "%04d", Int.random(in: 1...9999))
        } while OlympiadAddParticipantView.participantsPerOlympiad[selectedOlympiad.title]?.contains(where: { $0.code == newCode }) ?? false

        let newParticipant = Participant(name: name, code: newCode, subject: selectedOlympiad.title)

        OlympiadAddParticipantView.participantsPerOlympiad[selectedOlympiad.title, default: []].append(newParticipant)
        
        OlympiadAddParticipantView.saveParticipantsToUserDefaults(OlympiadAddParticipantView.participantsPerOlympiad)
        
        textField.text = ""
        tableView.reloadData()
    }

    
    //MARK: - TableView Configurations
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return OlympiadAddParticipantView.participantsPerOlympiad[selectedOlympiad.title]?.count ?? 0
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "simpleCell")

        guard let participantsForOlympiad = OlympiadAddParticipantView.participantsPerOlympiad[selectedOlympiad.title] else {
            return cell
        }
        
        let participant = participantsForOlympiad[indexPath.row]
        let name = participant.name
        let code = participant.code
        
        cell.textLabel?.text = "\(indexPath.row + 1). \(name) - \(code)"
        cell.textLabel?.font = .systemFont(ofSize: 10)
        
        cell.separatorInset = .zero
        cell.layoutMargins = .zero
        cell.preservesSuperviewLayoutMargins = false

        return cell
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 17
    }
    
    static func saveParticipantsToUserDefaults(_ data: [String: [Participant]]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(data) {
            UserDefaults.standard.set(encoded, forKey: "participantsPerOlympiad")
        }
    }

    static func loadParticipantsFromUserDefaults() -> [String: [Participant]] {
        let decoder = JSONDecoder()
        if let savedData = UserDefaults.standard.data(forKey: "participantsPerOlympiad"),
           let decoded = try? decoder.decode([String: [Participant]].self, from: savedData) {
            return decoded
        }
        return [:] // Return empty dictionary if failed
    }

}


// MARK: - Setting UI Methods
private extension OlympiadAddParticipantView {
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        addSubview(titleLabel)
        addSubview(textField)
        addSubview(saveButton)
        addSubview(cancelButton)
        addSubview(tableView)
        addSubview(enterCodeButton)
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(9)
            make.centerX.equalToSuperview()
        }
        
        textField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(9)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(35)
        }
        
        saveButton.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(9)
            make.leading.equalToSuperview().offset(20)
            make.width.equalTo(70)
            make.height.equalTo(20)
        }
        
        cancelButton.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(9)
            make.leading.equalTo(saveButton.snp.trailing).offset(11)
            make.width.equalTo(70)
            make.height.equalTo(20)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(saveButton.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(28)
            make.bottom.equalToSuperview().offset(-16)
        }

    }
}

