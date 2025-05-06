//
//  MaterialsViewController.swift
//  Edustaz DEMO
//
//  Created by Yernur Adilbek on 3/18/25.
//

import UIKit

class MaterialsViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.text = "Оқу әдістемелік материалдар"
        return label
    }()
    
    private lazy var searchBackView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var searchIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "search"))
        return imageView
    }()
    
    private lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Іздеген тақырыпты енгізіңіз"
        return textField
    }()
    
    private lazy var filterStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [type, classButton, subjectButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var type: UIButton = {
        let button = UIButton(type: .system)
        button.setAttributedTitle(attributedTitle(text: "Бағыт", imageName: "chevron.down"), for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        button.backgroundColor = .white
        button.menu = createMenu(title: "Бағыт", options: ["Презентация", "Ашық сабақ"]) { selected in
            self.selectedDirection = selected
            self.filterMaterials() // Refresh table when selection changes
        }
        button.showsMenuAsPrimaryAction = true
        return button
    }()

    private lazy var classButton: UIButton = {
        let button = UIButton(type: .system)
        button.setAttributedTitle(attributedTitle(text: "Сынып", imageName: "chevron.down"), for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        button.backgroundColor = .white
        button.menu = createMenu(title: "Сынып", options: (1...11).map { "\($0) сынып" }) { selected in
            self.selectedClass = selected!.components(separatedBy: " ").first.flatMap { Int($0) }
            self.filterMaterials() // Refresh table when selection changes
        }
        button.showsMenuAsPrimaryAction = true
        return button
    }()


    private lazy var subjectButton: UIButton = {
        let button = UIButton(type: .system)
        button.setAttributedTitle(attributedTitle(text: "Пән", imageName: "chevron.down"), for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        button.backgroundColor = .white
        button.menu = createMenu(title: "Пән", options: ["Математика", "Физика", "Қазақ тілі", "Информатика", "География", "Дене шынықтыру"]) { selected in
            self.selectedSubject = selected
            self.filterMaterials() // Refresh table when selection changes
        }
        button.showsMenuAsPrimaryAction = true
        return button
    }()
    
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.register(MaterialTableViewCell.self, forCellReuseIdentifier: MaterialTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    let materials = MaterialManager.shared.materials
    var filteredMaterials: [Material] = []
    
    private var selectedDirection: String?
    private var selectedClass: Int?
    private var selectedSubject: String?


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.97, green: 0.96, blue: 0.96, alpha: 1.00)
        
        self.navigationItem.title = "Материалдар"
        setupUI()
        NotificationCenter.default.addObserver(self, selector: #selector(updateMaterials), name: Notification.Name("MaterialsUpdated"), object: nil)

        filteredMaterials = MaterialManager.shared.materials
//        filteredMaterials = materials
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    
    @objc func updateMaterials() {
        filteredMaterials = MaterialManager.shared.materials
        tableView.reloadData()
    }

    
    
    //MARK: - Dropdown buttons setup
    func attributedTitle(text: String, imageName: String) -> NSAttributedString {
        let textAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 12, weight: .regular),
            .foregroundColor: UIColor.black
        ]
        
        let attributedText = NSMutableAttributedString(string: text, attributes: textAttributes)

        if let image = UIImage(systemName: imageName) {
            let attachment = NSTextAttachment()
            attachment.image = image.withTintColor(.black, renderingMode: .alwaysOriginal)
            attachment.bounds = CGRect(x: 0, y: 0, width: 8, height: 4.5)
            
            let imageString = NSAttributedString(attachment: attachment)
            attributedText.append(NSAttributedString(string: " "))
            attributedText.append(imageString)
        }

        return attributedText
    }
    
    private func createMenu(title: String, options: [String], selectionHandler: @escaping (String?) -> Void) -> UIMenu {
        let menuActions = options.map { option in
            let isSelected = (title == "Бағыт" && selectedDirection == option) ||
                             (title == "Сынып" && (selectedClass != nil && "\(selectedClass!) сынып" == option)) ||
                             (title == "Пән" && selectedSubject == option)

            return UIAction(title: option, image: isSelected ? UIImage(systemName: "checkmark") : nil, handler: { _ in
                if isSelected {
                    // If already selected, deselect it
                    if title == "Бағыт" {
                        self.selectedDirection = nil
                    } else if title == "Сынып" {
                        self.selectedClass = nil
                    } else if title == "Пән" {
                        self.selectedSubject = nil
                    }
                } else {
                    // Otherwise, select the new option
                    if title == "Бағыт" {
                        self.selectedDirection = option
                    } else if title == "Сынып" {
                        // Safe unwrapping before using `.components(separatedBy:)`
                        let components = option.components(separatedBy: " ")
                        if let first = components.first, let classInt = Int(first) {
                            self.selectedClass = classInt
                        }
                    } else if title == "Пән" {
                        self.selectedSubject = option
                    }
                }

                self.updateMenus() // Refresh checkmarks
                self.filterMaterials() // Refresh table
            })
        }

        return UIMenu(title: title, children: menuActions)
    }




    
    private func updateMenus() {
        type.menu = createMenu(title: "Бағыт", options: ["Презентация", "Ашық сабақ"]) { selected in
            self.selectedDirection = selected
            self.filterMaterials()
        }

        classButton.menu = createMenu(title: "Сынып", options: (1...11).map { "\($0) сынып" }) { selected in
            guard let selected = selected else {
                self.selectedClass = nil
                return
            }

            let components = selected.components(separatedBy: " ")
            if let first = components.first, let classInt = Int(first) {
                self.selectedClass = classInt
            }

            self.filterMaterials()
        }

        subjectButton.menu = createMenu(title: "Пән", options: ["Математика", "Физика", "Қазақ тілі", "Информатика", "География", "Дене шынықтыру"]) { selected in
            self.selectedSubject = selected
            self.filterMaterials()
        }
    }

    
    private func filterMaterials() {
        filteredMaterials = materials.filter { material in
            let matchesDirection = selectedDirection == nil || material.type == selectedDirection
            let matchesClass = selectedClass == nil || material.grade == selectedClass
            let matchesSubject = selectedSubject == nil || material.subject == selectedSubject
            
            return matchesDirection && matchesClass && matchesSubject
        }
        
        tableView.reloadData()
    }



    
    //MARK: - TableView setup
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredMaterials.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MaterialTableViewCell.identifier, for: indexPath) as! MaterialTableViewCell
        
        cell.configure(material: filteredMaterials[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 67
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = MaterialDetailViewController()
        detailVC.material = filteredMaterials[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }

}


// MARK: - setting iui methods
private extension MaterialsViewController {
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.addSubview(titleLabel)
        view.addSubview(searchBackView)
        searchBackView.addSubview(searchIcon)
        searchBackView.addSubview(searchTextField)
        
        view.addSubview(filterStackView)
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(13)
            make.centerX.equalToSuperview()
        }
        
        searchBackView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(12)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(32)
        }
        
        searchIcon.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.height.width.equalTo(20)
            make.centerY.equalToSuperview()
        }
        
        searchTextField.snp.makeConstraints { make in
            make.leading.equalTo(searchIcon.snp.trailing).offset(12)
            make.height.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        filterStackView.snp.makeConstraints { make in
            make.top.equalTo(searchBackView.snp.bottom).offset(12)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(40)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(filterStackView.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview()
            
        }
    }
}

