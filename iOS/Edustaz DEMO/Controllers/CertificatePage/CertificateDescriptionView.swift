//
//  CertificateDescriptionView.swift
//  Edustaz DEMO
//
//  Created by Yernur Adilbek on 4/25/25.
//

import UIKit

class CertificateDescriptionView: UIView {
    
    var onBackTapped: (() -> Void)?
//    var onStartTestTapped: (() -> Void)?
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "back"), for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var subjectImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .black
        return imageView
    }()
    
    private lazy var subjectTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 11, weight: .regular)
        label.textColor = .black
        label.text = "Тест Пәні:"
        return label
    }()
    
    private lazy var subjectSubTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 11, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    private lazy var typeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile")
        return imageView
    }()
    
    private lazy var typeTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 11, weight: .regular)
        label.textColor = .black
        label.text = "Қатысушы:"
        return label
    }()
    
    private lazy var typeSubTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 11, weight: .regular)
        label.textColor = .black
        label.text = "Ұстаз"
        return label
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.textColor = .black
        label.numberOfLines = 2
        label.text = "50 сұрақтан тұратын нағыз ПББ форматына сай тест тапсыр"
        return label
    }()
    
    private lazy var hintLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.textColor = .black
        label.numberOfLines = 4
        label.text = "Аттестацияда (ПББ) келетін тақырыптар бойынша жасалған тесттермен дайындалып, бізбен бірге тестілеуден оңай өтесіз"
        label.textColor = UIColor(red: 0.16, green: 0.53, blue: 0.20, alpha: 1.00)
        return label
    }()
    
    private lazy var startTestButton: UIButton = {
        let button = UIButton()
        button.setTitle("Тестті тапсыру", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13, weight: .medium)
        button.backgroundColor = UIColor(red: 0.28, green: 0.25, blue: 0.88, alpha: 1.00)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(startTestButtonTapped), for: .touchUpInside)
        return button
    }()
    
//    private lazy var testView: TestView = {
//        let view = TestView(with: testBrain!)
//        view.isHidden = true
//        view.onExitTest = { [weak self] in
//            self?.isHidden = true
//            self?.onBackTapped?()
//        }
//        return view
//    }()
    
    private var testBrain: TestBrain?
    private var testView: TestView?

    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure (with olympiad: Olympiad) {
        titleLabel.text = "\(olympiad.title) пәнінен Толық ППБ форматына сай тест"
        subjectImageView.image = UIImage(named: olympiad.imageView)?.withRenderingMode(.alwaysTemplate)
        subjectSubTitleLabel.text = olympiad.title
        
        if let subject = Subject.from(kazakhTitle: olympiad.title) {
            testBrain = TestBrain(subject: subject, testType: .attestation)
            
            testView?.removeFromSuperview()

            let newTestView = TestView(with: testBrain!)
            newTestView.isHidden = true
            newTestView.onExitTest = { [weak self] in
                self?.isHidden = true
                self?.onBackTapped?()
            }

            testView = newTestView
            addSubview(newTestView)
            
            newTestView.snp.makeConstraints { make in
                make.size.equalToSuperview()
            }
        } else {
            print("Invalid subject: \(olympiad.title)")
        }
    }
    
    @objc private func backButtonTapped() {
        onBackTapped?()
    }
    
    @objc func startTestButtonTapped() {
        containerView.isHidden = true
        testView!.isHidden = false
    }

}


// MARK: - Setting UI Methods
private extension CertificateDescriptionView {
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        addSubview(containerView)
        containerView.addSubview(backButton)
        containerView.addSubview(titleLabel)
        
        containerView.addSubview(subjectImageView)
        containerView.addSubview(subjectTitleLabel)
        containerView.addSubview(subjectSubTitleLabel)
        
        containerView.addSubview(typeImageView)
        containerView.addSubview(typeTitleLabel)
        containerView.addSubview(typeSubTitleLabel)
        
        containerView.addSubview(subTitleLabel)
        
        containerView.addSubview(hintLabel)
        
        containerView.addSubview(startTestButton)
        
//        addSubview(testView)
    }
    
    func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.size.equalToSuperview()
        }
        
        backButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(22)
            make.leading.equalToSuperview().offset(5)
            make.size.equalTo(17)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(17)
            make.leading.equalTo(backButton.snp.trailing)
            make.trailing.equalToSuperview().offset(-21)
        }
        
        subjectImageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(23)
            make.leading.equalToSuperview().offset(39)
            make.size.equalTo(30)
        }
        subjectTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(subjectImageView)
            make.leading.equalTo(subjectImageView.snp.trailing).offset(19)
        }
        subjectSubTitleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(subjectImageView)
            make.leading.equalTo(subjectTitleLabel)
        }
        
        typeImageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(23)
            make.leading.equalTo(subjectTitleLabel.snp.trailing).offset(65)
            make.size.equalTo(30)
        }
        typeTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(typeImageView)
            make.leading.equalTo(typeImageView.snp.trailing).offset(19)
        }
        typeSubTitleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(typeImageView)
            make.leading.equalTo(typeTitleLabel)
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(subjectSubTitleLabel.snp.bottom).offset(30)
//            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(40)
        }
        
        hintLabel.snp.makeConstraints { make in
            make.top.equalTo(subTitleLabel.snp.bottom).offset(21)
            make.leading.trailing.equalToSuperview().inset(40)
        }
        
        startTestButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(35)
            make.height.equalTo(35)
            make.bottom.equalToSuperview().offset(-74)
        }
        
//        testView.snp.makeConstraints { make in
//            make.size.equalToSuperview()
//        }
    }
}

