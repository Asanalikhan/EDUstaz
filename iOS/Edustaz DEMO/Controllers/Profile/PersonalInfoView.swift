//
//  PersonalInfoView.swift
//  Edustaz DEMO
//
//  Created by Yernur Adilbek on 4/25/25.
//

import UIKit

class PersonalInfoView: UIView {
    
    private lazy var personalLabel: UILabel = {
        let label = UILabel()
        label.text = "Жеке ақпараттар"
        label.font = .systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    private lazy var photoView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.90, green: 0.92, blue: 0.96, alpha: 1.00)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.51, green: 0.51, blue: 0.51, alpha: 1.00).cgColor
        view.layer.cornerRadius = 22.5
        return view
    }()
    
    private lazy var photoIconImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "ava"))
        imageView.tintColor = .white
        return imageView
    }()
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Атыңыз"
        textField.backgroundColor = UIColor(red: 0.90, green: 0.92, blue: 0.96, alpha: 1.00)
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.00).cgColor
        textField.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        textField.textColor = UIColor.black
        return textField
    }()
    
    private lazy var surnameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Тегіңіз"
        textField.backgroundColor = UIColor(red: 0.90, green: 0.92, blue: 0.96, alpha: 1.00)
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.00).cgColor
        textField.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        textField.textColor = UIColor.black
        return textField
    }()
    
    private lazy var professionalLabel: UILabel = {
        let label = UILabel()
        label.text = "Кәсіби ақпараттар"
        label.font = .systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    private lazy var regionTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Облысыңызды жазыңыз"
        textField.backgroundColor = UIColor(red: 0.90, green: 0.92, blue: 0.96, alpha: 1.00)
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.00).cgColor
        textField.font = UIFont.systemFont(ofSize: 9, weight: .regular)
        textField.textColor = UIColor.black
        return textField
    }()
    
    private lazy var districtTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Ауданды жазыңыз"
        textField.backgroundColor = UIColor(red: 0.90, green: 0.92, blue: 0.96, alpha: 1.00)
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.00).cgColor
        textField.font = UIFont.systemFont(ofSize: 9, weight: .regular)
        textField.textColor = UIColor.black
        return textField
    }()
    
    private lazy var schoolTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Мектепті жазыңыз"
        textField.backgroundColor = UIColor(red: 0.90, green: 0.92, blue: 0.96, alpha: 1.00)
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.00).cgColor
        textField.font = UIFont.systemFont(ofSize: 9, weight: .regular)
        textField.textColor = UIColor.black
        return textField
    }()
    
    private lazy var professionTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Лауазымды жазыңыз"
        textField.backgroundColor = UIColor(red: 0.90, green: 0.92, blue: 0.96, alpha: 1.00)
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.00).cgColor
        textField.font = UIFont.systemFont(ofSize: 9, weight: .regular)
        textField.textColor = UIColor.black
        return textField
    }()
    
    private lazy var aboutTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Өзіңіз жайлы қосымша мәлімет"
        textField.backgroundColor = UIColor(red: 0.90, green: 0.92, blue: 0.96, alpha: 1.00)
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.00).cgColor
        textField.font = UIFont.systemFont(ofSize: 9, weight: .regular)
        textField.textColor = UIColor.black
        
        return textField
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Сақтау", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        button.backgroundColor = UIColor(red: 0.28, green: 0.25, blue: 0.88, alpha: 1.00)
        button.layer.cornerRadius = 5
        return button
    }()
    

    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        layer.cornerRadius = 5
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


// MARK: - Setting UI Methods
private extension PersonalInfoView {
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        addSubview(personalLabel)
        addSubview(photoView)
        photoView.addSubview(photoIconImageView)
        addSubview(nameTextField)
        addSubview(surnameTextField)
        
        addSubview(professionalLabel)
        addSubview(regionTextField)
        addSubview(districtTextField)
        addSubview(schoolTextField)
        addSubview(professionTextField)
        addSubview(aboutTextField)
        addSubview(saveButton)
    }
    
    func setupConstraints() {
        personalLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(29)
            make.leading.equalToSuperview().offset(23)
        }
        
        photoView.snp.makeConstraints { make in
            make.top.equalTo(personalLabel.snp.bottom).offset(23)
            make.size.equalTo(90)
            make.leading.equalToSuperview().offset(34)
        }
        
        photoIconImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(45)
        }
        
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(photoView)
            make.leading.equalTo(photoView.snp.trailing).offset(29)
            make.trailing.equalToSuperview().offset(-35)
            make.height.equalTo(38)
        }
        
        surnameTextField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(14)
            make.leading.equalTo(photoView.snp.trailing).offset(29)
            make.trailing.equalToSuperview().offset(-35)
            make.height.equalTo(38)
        }
        
        professionalLabel.snp.makeConstraints { make in
            make.top.equalTo(photoView.snp.bottom).offset(29)
            make.leading.equalToSuperview().offset(23)
        }
        
        regionTextField.snp.makeConstraints { make in
            make.top.equalTo(professionalLabel.snp.bottom).offset(23)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalTo(self.snp.centerX).offset(-5)
            make.height.equalTo(37)
        }
        
        districtTextField.snp.makeConstraints { make in
            make.top.equalTo(regionTextField)
            make.trailing.equalToSuperview().offset(-20)
            make.leading.equalTo(self.snp.centerX).offset(5)
            make.height.equalTo(37)
        }
        
        schoolTextField.snp.makeConstraints { make in
            make.top.equalTo(regionTextField.snp.bottom).offset(14)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalTo(self.snp.centerX).offset(-5)
            make.height.equalTo(37)
        }
        
        professionTextField.snp.makeConstraints { make in
            make.top.equalTo(schoolTextField)
            make.trailing.equalToSuperview().offset(-20)
            make.leading.equalTo(self.snp.centerX).offset(5)
            make.height.equalTo(37)
        }
        
        aboutTextField.snp.makeConstraints { make in
            make.top.equalTo(schoolTextField.snp.bottom).offset(14)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(106)
        }
        
        saveButton.snp.makeConstraints { make in
            make.top.equalTo(aboutTextField.snp.bottom).offset(17)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(42)
        }
    }
}

