//
//  OlympiadDescriptionView.swift
//  Edustaz DEMO
//
//  Created by Yernur Adilbek on 4/11/25.
//

import UIKit
import SVProgressHUD

class OlympiadDescriptionView: UIView, UITextFieldDelegate {
    
    var onBackTapped: (() -> Void)?
    
    
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
        label.text = "Олимпиада Пәні:"
        return label
    }()
    
    private lazy var subjectSubTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 11, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    private lazy var dateImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "calendar")
        return imageView
    }()
    
    private lazy var dateTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 11, weight: .regular)
        label.textColor = .black
        label.text = "Уақыты:"
        return label
    }()
    
    private lazy var dateSubTitleLabel: UILabel = {
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
        return label
    }()
    
    private lazy var addParticipantButton: UIButton = {
        let button = UIButton()
        button.setTitle("Қатысушы қосу", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 0.28, green: 0.25, blue: 0.88, alpha: 1.00)
        button.layer.cornerRadius = 10
        button.titleLabel?.font =  UIFont.systemFont(ofSize: 13, weight: .medium)
        button.addTarget(self, action: #selector(addParticipantTapped), for: .touchUpInside)
        return button
    }()

    private lazy var instructionView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var instructionTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.textColor = UIColor(red: 0.16, green: 0.53, blue: 0.20, alpha: 1.00)
        label.text = "Қатысу нұсқаулығы"
        return label
    }()
    
    private lazy var instructionSubTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 11, weight: .regular)
        label.numberOfLines = 0
        
        let text = """
        1. Қатысушының аты-жөнін енгізіңіз (Бірнеше қатысушы болса барлығының аты-жөнін жазыңыз) 
        2. Тестті бастау батырмасын басып тест тапсырыңыз (Басқа қолданушыға көмек ретінде тіркесеңіз қатысу кодын беріңіз. Өзі код арқылы тапсыра алады) 
        3. Марапатты жүктеп алыңыз (Қатысушы тест біткен соң нәтижесі шыққан беттен өзі жүктеп алуына болады)
        """
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 6 // you can change this value
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 11),
            .paragraphStyle: paragraphStyle
        ]
        
        label.attributedText = NSAttributedString(string: text, attributes: attributes)
        
        return label
    }()

    
    private lazy var enterCodeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Код еңгізу", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor(red: 0.28, green: 0.25, blue: 0.88, alpha: 1.00).cgColor
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 10
        button.titleLabel?.font =  UIFont.systemFont(ofSize: 12, weight: .medium)
        button.addTarget(self, action: #selector(enterCodeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var instructionDownloadButton: UIButton = {
        let button = UIButton()
        button.setTitle("Нұсқаулықты жүктеу", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor(red: 0.28, green: 0.25, blue: 0.88, alpha: 1.00).cgColor
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 10
        button.titleLabel?.font =  UIFont.systemFont(ofSize: 12, weight: .medium)
        return button
    }()
    
    private lazy var enterCodeButtonPurple: UIButton = {
        let button = UIButton()
        button.setTitle("Код еңгізу", for: .normal)
        button.titleLabel?.font =  UIFont.systemFont(ofSize: 13, weight: .regular)
        button.backgroundColor = UIColor(red: 0.28, green: 0.25, blue: 0.88, alpha: 1.00)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(enterCodeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private var addParticipantView: OlympiadAddParticipantView?
    private var currentOlympiad: Olympiad?
    private var testBrain: TestBrain?

    
//    private lazy var testView: TestView = {
//        let view = TestView(with: testBrain!)
//        view.isHidden = true
//        view.onExitTest = { [weak self] in
//            self?.isHidden = true
//            self?.onBackTapped?()
//        }
//        return view
//    }()
    private var testView: TestView?

    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        layer.cornerRadius = 12
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with olympiad: Olympiad, for type: String) {
        currentOlympiad = olympiad
        titleLabel.text = "\(olympiad.month) айында \(olympiad.title) пәнінен \(type) арасындағы олимпиада"
        subjectImageView.image = UIImage(named: olympiad.imageView)?.withRenderingMode(.alwaysTemplate)
        subjectSubTitleLabel.text = olympiad.title
        
        dateSubTitleLabel.text = "1-31 \(olympiad.month) аралығында"
        
        typeSubTitleLabel.text = "\(type) арасында"
        
        resetViewVisibility()

        let view = OlympiadAddParticipantView(selectedOlympiad: olympiad)
        
        view.onAddParticipantTapped = { [weak self] in
            self?.addParticipantButton.isHidden = false
            self?.instructionView.isHidden = false
            self?.enterCodeButton.isHidden = false
            self?.instructionDownloadButton.isHidden = false

            self?.addParticipantView?.isHidden = true
            self?.enterCodeButtonPurple.isHidden = true
        }

        addParticipantView?.removeFromSuperview()
        addParticipantView = view
        addParticipantView?.isHidden = true
        addSubview(view)
        
        addParticipantView!.snp.makeConstraints { make in
            make.top.equalTo(typeImageView.snp.bottom).offset(25)
            make.leading.trailing.equalToSuperview().inset(25)
            make.height.equalTo(219)
        }
        
        if let subject = Subject.from(kazakhTitle: olympiad.title) {
            testBrain = TestBrain(subject: subject, testType: .olympiad)
            
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
 
        
        print("Available subjects:", Subject.allCases.map { $0.rawValue })


    }

    
    @objc private func backButtonTapped() {
        onBackTapped?()
    }
    
    private func resetViewVisibility() {
        addParticipantButton.isHidden = false
        instructionView.isHidden = false
        enterCodeButton.isHidden = false
        instructionDownloadButton.isHidden = false
        addParticipantView?.isHidden = true
        enterCodeButtonPurple.isHidden = true
    }

    
    @objc private func addParticipantTapped() {
        addParticipantButton.isHidden = true
        instructionView.isHidden = true
        enterCodeButton.isHidden = true
        instructionDownloadButton.isHidden = true

        addParticipantView?.isHidden = false
        enterCodeButtonPurple.isHidden = false
    }

    
    @objc func enterCodeButtonTapped() {
        guard let _ = testView else {
            SVProgressHUD.showError(withStatus: "Тест дайын емес. Алдымен олимпиаданы таңдаңыз.")
            return
        }
        
        let alert = UIAlertController(title: "Код теріңіз", message: nil, preferredStyle: .alert)

        alert.addTextField { textField in
            textField.placeholder = "0000"
            textField.textAlignment = .center
            textField.keyboardType = .numberPad
            textField.font = .systemFont(ofSize: 13, weight: .regular)
            textField.layer.cornerRadius = 8
            textField.delegate = self
        }
        
        let startAction = UIAlertAction(title: "Олимпиаданы бастау", style: .default) { _ in
            let enteredCode = alert.textFields?.first?.text ?? ""

            if var participants = OlympiadAddParticipantView.participantsPerOlympiad[self.currentOlympiad!.title] {
                if let index = participants.firstIndex(where: { $0.code == enteredCode }) {
                    participants.remove(at: index)
                    OlympiadAddParticipantView.participantsPerOlympiad[self.currentOlympiad!.title] = participants
                    
                    OlympiadAddParticipantView.saveParticipantsToUserDefaults(OlympiadAddParticipantView.participantsPerOlympiad)

//                    self.addParticipantView?.isHidden = true
//                    self.testView!.isHidden = false
                    if let testView = self.testView {
                        self.addParticipantView?.isHidden = true
                        testView.isHidden = false
                    } else {
                        SVProgressHUD.showError(withStatus: "Тест табылмады. Қайта көріңіз.")
                    }

                } else {
                    SVProgressHUD.showError(withStatus: "Код табылмады. Қайта енгізіңіз.")
                }
            } else {
                SVProgressHUD.showError(withStatus: "Қатысушылар табылмады.")
            }
        }


        
        alert.addAction(startAction)
        
        parentViewController()?.present(alert, animated: true, completion: nil)
    }
    
    //MARK: - TextField Delegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        if !allowedCharacters.isSuperset(of: characterSet) {
            return false
        }
        
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        return updatedText.count <= 4
    }


}

//MARK: - Getting Parent View Controller to present an allert
extension UIView {
    func parentViewController() -> UIViewController? {
        var parentResponder: UIResponder? = self
        while let nextResponder = parentResponder?.next {
            parentResponder = nextResponder
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}



// MARK: - Setting UI Methods
private extension OlympiadDescriptionView {
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        addSubview(backButton)
        addSubview(titleLabel)
        
        addSubview(subjectImageView)
        addSubview(subjectTitleLabel)
        addSubview(subjectSubTitleLabel)
        
        addSubview(dateImageView)
        addSubview(dateTitleLabel)
        addSubview(dateSubTitleLabel)
        
        addSubview(typeImageView)
        addSubview(typeTitleLabel)
        addSubview(typeSubTitleLabel)
        
        addSubview(addParticipantButton)
        
        addSubview(instructionView)
        instructionView.addSubview(instructionTitleLabel)
        instructionView.addSubview(instructionSubTitleLabel)
        
        addSubview(enterCodeButton)
        addSubview(instructionDownloadButton)
        
        addSubview(enterCodeButtonPurple)
        enterCodeButtonPurple.isHidden = true
        
//        addSubview(testView)
    }
    
    func setupConstraints() {
        backButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(22)
            make.leading.equalToSuperview().offset(5)
            make.size.equalTo(17)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(9)
            make.leading.equalTo(backButton.snp.trailing)
            make.trailing.equalToSuperview().offset(-21)
        }
        
        subjectImageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(33)
            make.leading.equalToSuperview().offset(29)
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
        
        dateImageView.snp.makeConstraints { make in
            make.top.equalTo(subjectImageView.snp.bottom).offset(18)
            make.leading.equalToSuperview().offset(29)
            make.size.equalTo(30)
        }
        dateTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(dateImageView)
            make.leading.equalTo(dateImageView.snp.trailing).offset(19)
        }
        dateSubTitleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(dateImageView)
            make.leading.equalTo(dateTitleLabel)
        }
        
        typeImageView.snp.makeConstraints { make in
            make.top.equalTo(dateImageView.snp.bottom).offset(18)
            make.leading.equalToSuperview().offset(29)
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
        
        addParticipantButton.snp.makeConstraints { make in
            make.top.equalTo(typeImageView.snp.bottom).offset(25)
            make.leading.trailing.equalToSuperview().inset(24)
            make.centerX.equalToSuperview()
            make.height.equalTo(35)
        }
        
        instructionView.snp.makeConstraints { make in
            make.top.equalTo(addParticipantButton.snp.bottom).offset(18)
            make.leading.trailing.equalToSuperview().inset(15)
            make.height.equalTo(180)
        }
        instructionTitleLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
            
        }
        instructionSubTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(instructionTitleLabel.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        enterCodeButton.snp.makeConstraints { make in
            make.top.equalTo(instructionView.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(15)
            make.width.equalTo(145)
            make.height.equalTo(35)
        }
        
        instructionDownloadButton.snp.makeConstraints { make in
            make.top.equalTo(instructionView.snp.bottom).offset(16)
            make.trailing.equalToSuperview().offset(-15)
            make.width.equalTo(145)
            make.height.equalTo(35)
        }
        
        enterCodeButtonPurple.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-53)
            make.centerX.equalToSuperview()
            make.height.equalTo(35)
            make.leading.trailing.equalToSuperview().inset(25)
        }
//        
//        testView.snp.makeConstraints { make in
//            make.size.equalToSuperview()
//        }
    }
}

