//
//  MaterialView.swift
//  Edustaz DEMO
//
//  Created by Yernur Adilbek on 4/25/25.
//

import UIKit
import SVProgressHUD

class MaterialView: UIView, UIDocumentPickerDelegate, UITextViewDelegate, UITableViewDelegate, UITableViewDataSource {
    
    private lazy var topTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Материал ақпаратын енгізу"
        label.font = .systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    private lazy var topicTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.placeholder = "Материал тақырыбы"
        textField.backgroundColor = UIColor(red: 0.90, green: 0.92, blue: 0.96, alpha: 1.00)
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.00).cgColor
        textField.font = UIFont.systemFont(ofSize: 9, weight: .regular)
        textField.textColor = UIColor.black
        return textField
    }()
    
    private lazy var docUploadView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.90, green: 0.92, blue: 0.96, alpha: 1.00)
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.00).cgColor
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(uploadTapped))
        view.addGestureRecognizer(tapGesture)
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private lazy var docUploadIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "upload")
        return imageView
    }()
    
    private lazy var docUploadLabel: UILabel = {
        let label = UILabel()
        label.text = "Файлды жүктеу"
        label.font = UIFont.systemFont(ofSize: 9, weight: .regular)
        label.textColor = UIColor.lightGray
        return label
    }()
    
    private lazy var docUploader: UIButton = {
        let button = UIButton()
        button.setTitle("Файлды жүктеу", for: .normal)
        button.setImage(UIImage(systemName: "square.and.arrow.down"), for: .normal)
        button.backgroundColor = UIColor(red: 0.90, green: 0.92, blue: 0.96, alpha: 1.00)
        button.addTarget(self, action: #selector(uploadTapped), for: .touchUpInside)
        button.backgroundColor = UIColor(red: 0.90, green: 0.92, blue: 0.96, alpha: 1.00)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.00).cgColor
        return button
    }()
    
    private lazy var typeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setAttributedTitle(attributedTitle(text: "Бағыт", imageName: "chevron.down"), for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        button.backgroundColor = .white
        button.menu = createMenu(title: "Бағыт", options: ["Презентация", "Ашық сабақ"]) { selected in
            self.typeButton.setAttributedTitle(NSAttributedString(string: selected), for: .normal)
            self.selectedType = selected
        }
        button.showsMenuAsPrimaryAction = true
        
        button.backgroundColor = UIColor(red: 0.90, green: 0.92, blue: 0.96, alpha: 1.00)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.00).cgColor
        return button
    }()
    
    private lazy var classButton: UIButton = {
        let button = UIButton(type: .system)
        button.setAttributedTitle(attributedTitle(text: "Сынып", imageName: "chevron.down"), for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        button.backgroundColor = .white
        button.menu = createMenu(title: "Сынып", options: (1...11).map { "\($0) сынып" }) {selected in
            self.classButton.setAttributedTitle(NSAttributedString(string: selected), for: .normal)
            self.selectedClass = selected.components(separatedBy: " ").first.flatMap { Int($0) }
        }
        button.showsMenuAsPrimaryAction = true
        
        button.backgroundColor = UIColor(red: 0.90, green: 0.92, blue: 0.96, alpha: 1.00)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.00).cgColor
        return button
    }()
    
    private lazy var subjectButton: UIButton = {
        let button = UIButton(type: .system)
        button.setAttributedTitle(attributedTitle(text: "Пән", imageName: "chevron.down"), for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        button.backgroundColor = .white
        button.menu = createMenu(title: "Пән", options: ["Тарих", "Жаратылыстану", "География", "Информатика", "Биология", "Физика", "Бастауыш сынып", "Музыка", "Психология", "Дене шынықтыру", "Қазақ тілі", "Орыс тілі", "Әскери дайындық", "Педагогика", "Құқық"]) { selected in
            self.subjectButton.setAttributedTitle(NSAttributedString(string: selected), for: .normal)
            self.selectedSubject = selected
        }
        button.showsMenuAsPrimaryAction = true
        
        button.backgroundColor = UIColor(red: 0.90, green: 0.92, blue: 0.96, alpha: 1.00)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.00).cgColor
        return button
    }()
    
    private lazy var filterStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [typeButton, classButton, subjectButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.textAlignment = .center
        textView.backgroundColor = UIColor(red: 0.90, green: 0.92, blue: 0.96, alpha: 1.00)
        textView.layer.cornerRadius = 5
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.00).cgColor
        textView.font = UIFont.systemFont(ofSize: 9, weight: .regular)
        textView.textColor = UIColor.black
        textView.textContainerInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        textView.text = "Материал тұралы қысқаша түсінік"
        textView.textColor = UIColor.lightGray
        textView.delegate = self
        return textView
    }()

    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.placeholder = "Сертификат алушының толық аты-жөні"
        textField.backgroundColor = UIColor(red: 0.90, green: 0.92, blue: 0.96, alpha: 1.00)
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.00).cgColor
        textField.font = UIFont.systemFont(ofSize: 9, weight: .regular)
        textField.textColor = UIColor.black
        return textField
    }()
    
    private lazy var uploadButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Материалды жүктеу", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        button.backgroundColor = UIColor(red: 0.28, green: 0.25, blue: 0.88, alpha: 1.00)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(uploadMaterial), for: .touchUpInside)
        return button
    }()
    
    private lazy var bottomTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Менің материалдарым"
        label.font = .systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UploadedMaterialTableViewCell.self, forCellReuseIdentifier: UploadedMaterialTableViewCell.identifier)
        tableView.isHidden = true
        return tableView
    }()
    
    private lazy var emptyLabel: UILabel = {
        let label = UILabel()
        label.text = "Сіз әлі ешқандай материал жүктемедіңіз"
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .gray
        return label
    }()
    
    var materials: [Material] {
        return MaterialManager.shared.myMaterials
    }

    
    private var selectedType: String?
    private var selectedClass: Int?
    private var selectedSubject: String?

    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        layer.cornerRadius = 5
        setupUI()
        reloadTable()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reloadTable() {
        tableView.reloadData()
    }

    
    @objc func uploadMaterial() {
        SVProgressHUD.show()
        
        if topicTextField.text != "" && descriptionTextView.text != "" && nameTextField.text != "" && selectedType != nil && selectedClass != nil && selectedSubject != nil {
            SVProgressHUD.dismiss()
            let addingMaterial = Material(title: topicTextField.text!, subtitle: descriptionTextView.text!, author: nameTextField.text!, type: selectedType!, grade: selectedClass!, subject: selectedSubject!, downloadCount: 0, viewCount: 0)
            MaterialManager.shared.add(addingMaterial)
            MaterialManager.shared.add(addingMaterial)
            NotificationCenter.default.post(name: Notification.Name("MaterialsUpdated"), object: nil)
            reloadTable()
            
            tableView.isHidden = false
            emptyLabel.isHidden = true
            
            topicTextField.text = ""
            nameTextField.text = ""
            selectedType = nil
            selectedClass = nil
            selectedSubject = nil
            
            typeButton.setAttributedTitle(attributedTitle(text: "Бағыт", imageName: "chevron.down"), for: .normal)
            subjectButton.setAttributedTitle(attributedTitle(text: "Пән", imageName: "chevron.down"), for: .normal)
            classButton.setAttributedTitle(attributedTitle(text: "Сынып", imageName: "chevron.down"), for: .normal)
            
            descriptionTextView.text = "Материал тұралы қысқаша түсінік"
            descriptionTextView.textColor = .lightGray
            descriptionTextView.textAlignment = .center
        } else {
            SVProgressHUD.showError(withStatus: "Барлығын толтырыңыз")
        }
    
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
    
    @objc private func uploadTapped() {
        let picker = UIDocumentPickerViewController(forOpeningContentTypes: [.item])
        picker.delegate = self
        parentViewController()?.present(picker, animated: true)
    }
    
    private func createMenu(title: String, options: [String], handler: @escaping (String) -> Void) -> UIMenu {
        let actions = options.map { option in
            UIAction(title: option) { _ in
                handler(option)
            }
        }
        return UIMenu(title: title, options: .displayInline, children: actions)
    }
    
    //MARK: - TextView Delegate
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = ""
            textView.textColor = .black
            textView.textAlignment = .left
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Материал тұралы қысқаша түсінік"
            textView.textColor = .lightGray
            textView.textAlignment = .center
        }
    }
    
    //MARK: - TableView Delegate and Data Source Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return materials.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UploadedMaterialTableViewCell.identifier, for: indexPath) as! UploadedMaterialTableViewCell

        cell.configure(material: materials[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }

}




// MARK: - Setting UI Methods
private extension MaterialView {
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        addSubview(topTitleLabel)
        
        addSubview(docUploadView)
        docUploadView.addSubview(docUploadIcon)
        docUploadView.addSubview(docUploadLabel)
        addSubview(topicTextField)
        
        addSubview(filterStackView)
        
        addSubview(descriptionTextView)
        addSubview(nameTextField)
        addSubview(uploadButton)
        
        addSubview(bottomTitleLabel)
        addSubview(tableView)
        
        addSubview(emptyLabel)
    }
    
    func setupConstraints() {
        topTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(17)
            make.leading.equalToSuperview().offset(20)
        }
        
        docUploadView.snp.makeConstraints { make in
            make.top.equalTo(topTitleLabel.snp.bottom).offset(17)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(100)
        }
        
        docUploadIcon.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(29)
            make.centerX.equalToSuperview()
            make.size.equalTo(23)
        }
        
        docUploadLabel.snp.makeConstraints { make in
            make.top.equalTo(docUploadIcon.snp.bottom).offset(2)
            make.centerX.equalToSuperview()
        }
        
        topicTextField.snp.makeConstraints { make in
            make.top.equalTo(docUploadView.snp.bottom).offset(6)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(37)
        }
        
        filterStackView.snp.makeConstraints { make in
            make.top.equalTo(topicTextField.snp.bottom).offset(6)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(25)
        }
        
        descriptionTextView.snp.makeConstraints { make in
            make.top.equalTo(filterStackView.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(106)
        }
        
        nameTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(descriptionTextView.snp.bottom).offset(7)
            make.height.equalTo(45)
        }
        
        uploadButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(42)
            make.top.equalTo(nameTextField.snp.bottom).offset(7)
        }
        
        bottomTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(uploadButton.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(23)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(bottomTitleLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(10)
        }
        
        emptyLabel.snp.makeConstraints { make in
            make.top.equalTo(bottomTitleLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
    }
}

