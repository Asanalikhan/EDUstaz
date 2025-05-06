//
//  ResultAlertView.swift
//  Edustaz DEMO
//
//  Created by Yernur Adilbek on 4/27/25.
//

import UIKit

class ResultAlertView: UIView {
    
    var parentVC: UIViewController?
    var onGoHomeTapped: (() -> Void)?
    var onHomeTapped: (() -> Void)?
    
//    var testBrain = TestBrain()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var circleView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 82.5
        view.layer.borderWidth = 15
        view.layer.borderColor = UIColor(red: 0.28, green: 0.25, blue: 0.88, alpha: 1.00).cgColor
        return view
    }()
    
    private lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 35, weight: .semibold)
        label.textColor = UIColor(red: 0.16, green: 0.53, blue: 0.20, alpha: 1.00)
        label.textAlignment = .center
        label.text = "15/20"
        return label
    }()
    
    private lazy var congrLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        label.textAlignment = .center
        label.text = "Нәтижемен құттықтаймыз!"
        return label
    }()
    
    private lazy var homeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Басты бетке өту", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13, weight: .medium)
        button.backgroundColor = UIColor(red: 0.28, green: 0.25, blue: 0.88, alpha: 1.00)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(goHome), for: .touchUpInside)
        return button
    }()
    
    private lazy var downloadButton: UIButton = {
        let button = UIButton()
        button.setTitle("Сертифифкатты жүктеу", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13, weight: .medium)
        button.backgroundColor = UIColor(red: 0.28, green: 0.25, blue: 0.88, alpha: 1.00)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
        
    init() {
        super.init(frame: .zero)
        backgroundColor = UIColor.black.withAlphaComponent(0.6)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func show(on parentView: UIView, result: String) {
        parentView.addSubview(self)
        self.frame = parentView.bounds
        alpha = 0
        UIView.animate(withDuration: 0.3) {
            self.alpha = 1
        }
        
        resultLabel.text = result
    }
    
    @objc func goHome() {
        self.removeFromSuperview()
        onHomeTapped?()
    }
}


// MARK: - Setting UI Methods
private extension ResultAlertView {
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        addSubview(containerView)
        containerView.addSubview(circleView)
        circleView.addSubview(resultLabel)
        
        containerView.addSubview(congrLabel)
        containerView.addSubview(homeButton)
        containerView.addSubview(downloadButton)
    }
    
    func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-30)
            make.height.equalTo(392)
            make.leading.trailing.equalToSuperview().inset(40)
        }
        
        circleView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(51)
            make.centerX.equalToSuperview()
            make.size.equalTo(165)
        }
        
        resultLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        congrLabel.snp.makeConstraints { make in
            make.top.equalTo(circleView.snp.bottom).offset(18)
            make.centerX.equalToSuperview()
        }
        
        homeButton.snp.makeConstraints { make in
            make.top.equalTo(congrLabel.snp.bottom).offset(26)
            make.leading.trailing.equalToSuperview().inset(55)
            make.height.equalTo(35)
        }
        
        downloadButton.snp.makeConstraints { make in
            make.top.equalTo(homeButton.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview().inset(55)
            make.height.equalTo(35)
        }
    }
}

