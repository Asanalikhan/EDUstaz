//
//  ForgotPasswordViewController.swift
//  Edustaz DEMO
//
//  Created by Yernur Adilbek on 3/13/25.
//

import UIKit
import SnapKit

class ForgotPasswordViewController: UIViewController {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Почтаңызды еңгізіңіз"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 24)
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Почтаңызға құпия сөзіңіз жіберіледі"
        label.font = .systemFont(ofSize: 14)
        label.textColor = UIColor(red: 0.32, green: 0.32, blue: 0.32, alpha: 1.00)
        return label
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Почтаңызды еңгізіңіз"
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 0.38, green: 0.38, blue: 0.38, alpha: 1.00).cgColor
        textField.layer.cornerRadius = 6
        return textField
    }()
    
    private lazy var sendButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Жөнделту", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 6
        button.backgroundColor = UIColor(red: 0.28, green: 0.25, blue: 0.88, alpha: 1.00)
        button.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let backItem = UIBarButtonItem()
        backItem.title = "Артқа"
        navigationItem.backBarButtonItem = backItem
        setupUI()
    }
    
    @objc func sendButtonTapped() {
        let vc = MessageSentViewController()
        
        if textField.text != "" {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    

}


// MARK: - setting iui methods
private extension ForgotPasswordViewController {
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(textField)
        view.addSubview(sendButton)
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(view.frame.height * 0.2)
            make.centerX.equalToSuperview()
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
        
        textField.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(35)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().inset(20)
            make.height.equalTo(48)
        }
        
        sendButton.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(35)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().inset(22)
            make.height.equalTo(48)
        }
    }
}
