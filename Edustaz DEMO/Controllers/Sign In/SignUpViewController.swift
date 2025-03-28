//
//  SignUpViewController.swift
//  Edustaz DEMO
//
//  Created by Yernur Adilbek on 3/13/25.
//

import UIKit
import SnapKit

class SignUpViewController: UIViewController {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Тіркелу"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 28)
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Почта"
        label.textColor = .black
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Почтаңызды еңгізіңіз"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 0.38, green: 0.38, blue: 0.38, alpha: 1.00).cgColor
        textField.layer.cornerRadius = 6
        return textField
    }()
    
    private lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Құпия сөз"
        label.textColor = .black
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Құпия сөзді еңгізіңіз"
        textField.isSecureTextEntry = true
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 0.38, green: 0.38, blue: 0.38, alpha: 1.00).cgColor
        textField.layer.cornerRadius = 6
        return textField
    }()
    
    private lazy var rePasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "Құпия сөзді қайта еңгізіңіз"
        label.textColor = .black
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var rePasswordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Құпия сөзді еңгізіңіз"
        textField.isSecureTextEntry = true
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 0.38, green: 0.38, blue: 0.38, alpha: 1.00).cgColor
        textField.layer.cornerRadius = 6
        return textField
    }()
    
    private lazy var showButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "show"), for: .normal)
        button.addTarget(self, action: #selector(showPassword), for: .touchUpInside)
        return button
    }()
    
    private var isChecked = false
    
    private lazy var saveMeButton: UIButton = {
        let button = UIButton()
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 0.38, green: 0.38, blue: 0.38, alpha: 1.00).cgColor
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(toggleCheckBox), for: .touchUpInside)
        return button
    }()
    
    private lazy var saveMeLabel: UILabel = {
        let label = UILabel()
        label.text = "Мені сақтау"
        label.textColor = .black
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    
    private lazy var signupButton: UIButton = {
        let button = UIButton()
        button.setTitle("Кіру", for: .normal)
        button.backgroundColor = UIColor(red: 0.28, green: 0.25, blue: 0.88, alpha: 1.00)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(signupTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    @objc func toggleCheckBox() {
        isChecked.toggle()
        let imageName = isChecked ? "checkmark.square.fill" : "square" // Заполненный или пустой
        saveMeButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    @objc func showPassword() {
        passwordTextField.isSecureTextEntry.toggle()
        rePasswordTextField.isSecureTextEntry.toggle()
    }
    
    @objc func signupTapped() {
        emailTextField.text != "" && passwordTextField.text != "" && passwordTextField.text == rePasswordTextField.text ? print("Sign up") : print("Fill all fields")
    }

}

// MARK: - setting iui methods
private extension SignUpViewController {
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.addSubview(titleLabel)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(rePasswordLabel)
        view.addSubview(rePasswordTextField)
        view.addSubview(showButton)
        view.addSubview(saveMeButton)
        view.addSubview(saveMeLabel)
        view.addSubview(signupButton)
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(view.frame.height * 0.1)
            make.centerX.equalToSuperview()
        }
        
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(20)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(5)
            make.width.equalToSuperview().inset(20)
            make.height.equalTo(48)
            make.centerX.equalToSuperview()
        }
        
        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(20)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(5)
            make.width.equalToSuperview().inset(20)
            make.height.equalTo(48)
            make.centerX.equalToSuperview()
        }
        
        rePasswordLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(20)
        }
        
        rePasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(rePasswordLabel.snp.bottom).offset(5)
            make.width.equalToSuperview().inset(20)
            make.height.equalTo(48)
            make.centerX.equalToSuperview()
        }
        
        showButton.snp.makeConstraints { make in
            make.trailing.equalTo(rePasswordTextField.snp.trailing).inset(16)
            make.height.width.equalTo(20)
            make.centerY.equalTo(rePasswordTextField)
        }
        
        saveMeButton.snp.makeConstraints { make in
            make.top.equalTo(rePasswordTextField.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(20)
            make.height.width.equalTo(24)
        }
        
        saveMeLabel.snp.makeConstraints { make in
            make.leading.equalTo(saveMeButton.snp.trailing).offset(2)
            make.centerY.equalTo(saveMeButton)
        }
        
        signupButton.snp.makeConstraints { make in
            make.top.equalTo(saveMeButton.snp.bottom).offset(70)
            make.width.equalToSuperview().inset(22)
            make.height.equalTo(48)
            make.centerX.equalToSuperview()
        }
    }
}

