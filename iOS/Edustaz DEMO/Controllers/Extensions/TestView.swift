//
//  TestView.swift
//  Edustaz DEMO
//
//  Created by Yernur Adilbek on 4/27/25.
//

import UIKit
import SnapKit

class TestView: UIView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        label.numberOfLines = 4
        label.textAlignment = .center
        return label
    }()
    
    private lazy var option1View = createOptionView()
    private lazy var option1CheckBox = CheckBox()
    private lazy var option1Label = createOptionLabel()
    
    private lazy var option2View = createOptionView()
    private lazy var option2CheckBox = CheckBox()
    private lazy var option2Label = createOptionLabel()
    
    private lazy var option3View = createOptionView()
    private lazy var option3CheckBox = CheckBox()
    private lazy var option3Label = createOptionLabel()
    
    private lazy var option4View = createOptionView()
    private lazy var option4CheckBox = CheckBox()
    private lazy var option4Label = createOptionLabel()
    
    private lazy var nextQuestionButton: UIButton = {
        let button = UIButton()
        button.setTitle("Келесі сұраққа өту", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13, weight: .medium)
        button.backgroundColor = UIColor(red: 0.28, green: 0.25, blue: 0.88, alpha: 1.00)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(nextQuestionButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var finishButton: UIButton = {
        let button = UIButton()
        button.setTitle("Тестті аяқтау", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13, weight: .medium)
        button.backgroundColor = UIColor(red: 0.28, green: 0.25, blue: 0.88, alpha: 1.00)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(finishButtonPressed), for: .touchUpInside)
        return button
    }()
    
    let customAlert = ResultAlertView()
    var onExitTest: (() -> Void)?

    
    var testBrain: TestBrain
    
    // MARK: - Init
    init(with testBrain: TestBrain) {
        self.testBrain = testBrain
        super.init(frame: .zero)
        backgroundColor = .white
        layer.cornerRadius = 5
        setupUI()
        updateUI()
    }
    
//    init() {
//        super.init(frame: .zero)
//        backgroundColor = .white
//        layer.cornerRadius = 5
//        testBrain.quiz.shuffle()
//        setupUI()
//        updateUI()
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func finishButtonPressed() {
        customAlert.show(on: parentViewController()!.view, result: "\(testBrain.getScore())/\(testBrain.quiz.count)")
        customAlert.onGoHomeTapped = { [weak self] in
            self?.goBackToMainScreen()
        }
        customAlert.onHomeTapped = { [weak self] in
            self?.isHidden = true
            self?.onExitTest?() // this will show back CertificateViewController screen
        }
        testBrain.reset()
    }
    
    private func goBackToMainScreen() {
        self.isHidden = true
        onExitTest?()
    }
    
    @objc func nextQuestionButtonPressed() {
        testBrain.nextQuession()
        updateUI()
    }
    
    func updateUI() {
        titleLabel.text = "Сұрақ № \(testBrain.questionNumber + 1)/\(testBrain.quiz.count)"
        questionLabel.text = testBrain.getQuestionText()
        option1Label.text = testBrain.getOptionTitle(option: 0)
        option2Label.text = testBrain.getOptionTitle(option: 1)
        option3Label.text = testBrain.getOptionTitle(option: 2)
        option4Label.text = testBrain.getOptionTitle(option: 3)
        
        option1CheckBox.isChecked = false
        option2CheckBox.isChecked = false
        option3CheckBox.isChecked = false
        option4CheckBox.isChecked = false
        
        if testBrain.questionNumber + 1 == testBrain.quiz.count {
            nextQuestionButton.isHidden = true
        }
    }
    
    // MARK: - Setup
    
    private func setupUI() {
        addSubview(titleLabel)
        addSubview(questionLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().inset(34)
        }
        
        questionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(19)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(88)
        }
        
        setupOption(view: option1View, checkBox: option1CheckBox, label: option1Label, topView: questionLabel, topOffset: 20)
        setupOption(view: option2View, checkBox: option2CheckBox, label: option2Label, topView: option1View, topOffset: 12)
        setupOption(view: option3View, checkBox: option3CheckBox, label: option3Label, topView: option2View, topOffset: 12)
        setupOption(view: option4View, checkBox: option4CheckBox, label: option4Label, topView: option3View, topOffset: 12)
        
        addSubview(nextQuestionButton)
        addSubview(finishButton)
        
        nextQuestionButton.snp.makeConstraints { make in
            make.top.equalTo(option4View.snp.bottom).offset(44)
            make.leading.trailing.equalToSuperview().inset(35)
            make.height.equalTo(35)
        }
        
        finishButton.snp.makeConstraints { make in
            make.top.equalTo(nextQuestionButton.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(35)
            make.height.equalTo(35)
        }
    }
    
    private func setupOption(view: UIView, checkBox: CheckBox, label: UILabel, topView: UIView, topOffset: CGFloat) {
        addSubview(view)
        view.addSubview(checkBox)
        view.addSubview(label)
        
        view.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom).offset(topOffset)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(48)
        }
        
        checkBox.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(12)
            make.width.height.equalTo(24)
        }
        
        label.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(checkBox.snp.trailing).offset(12)
            make.trailing.equalToSuperview().inset(12)
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleOptionTap(_:)))
        view.addGestureRecognizer(tapGesture)
        view.isUserInteractionEnabled = true
        view.tag = checkBox.hash // Match view and checkbox
    }
    
    private func createOptionView() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.90, green: 0.93, blue: 0.96, alpha: 1.00)
        view.layer.cornerRadius = 10
        return view
    }
    
    private func createOptionLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 2
        label.textColor = .black
        return label
    }
    
    // MARK: - Actions
    
    @objc private func handleOptionTap(_ gesture: UITapGestureRecognizer) {
        guard let tappedView = gesture.view else { return }

        // Uncheck all checkboxes
        let checkBoxes = [option1CheckBox, option2CheckBox, option3CheckBox, option4CheckBox]
        for checkBox in checkBoxes {
            checkBox.isChecked = false
        }

        // Check the tapped checkbox and get the selected answer
        var selectedAnswer: String = ""
        
        switch tappedView {
        case option1View:
            option1CheckBox.isChecked = true
            selectedAnswer = option1Label.text ?? ""
        case option2View:
            option2CheckBox.isChecked = true
            selectedAnswer = option2Label.text ?? ""
        case option3View:
            option3CheckBox.isChecked = true
            selectedAnswer = option3Label.text ?? ""
        case option4View:
            option4CheckBox.isChecked = true
            selectedAnswer = option4Label.text ?? ""
        default:
            break
        }
        
        _ = testBrain.checkAnswer(selectedAnswer) // Updates the score if correct
    }

}
