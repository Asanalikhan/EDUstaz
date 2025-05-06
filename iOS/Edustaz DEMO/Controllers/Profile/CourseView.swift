//
//  CourseView.swift
//  Edustaz DEMO
//
//  Created by Yernur Adilbek on 4/26/25.
//

import UIKit

class CourseView: UIView {
    
    private lazy var titLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.text = "Менің тіркелген курстарым"
        return label
    }()
    
    private lazy var pendingIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "pending"))
        return imageView
    }()
    
    private lazy var pendingLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.text = "Сіз ешқандай курстарға тіркелмегенсіз"
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Тіркелу", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        button.backgroundColor = UIColor(red: 0.28, green: 0.25, blue: 0.88, alpha: 1.00)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(goToCourse), for: .touchUpInside)
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
    
    @objc func goToCourse() {
        if let tabBarController = parentViewController()?.tabBarController {
            if let navController = tabBarController.selectedViewController as? UINavigationController {
                navController.popToRootViewController(animated: false)
            }
            tabBarController.selectedIndex = 3
        }

    }

}

// MARK: - Setting UI Methods
private extension CourseView {
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        addSubview(titLabel)
        addSubview(pendingIcon)
        addSubview(pendingLabel)
        addSubview(button)
    }
    
    func setupConstraints() {
        titLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(36)
            make.centerX.equalToSuperview()
        }
        
        button.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(36)
            make.leading.trailing.equalToSuperview().inset(88)
        }
        
        pendingLabel.snp.makeConstraints { make in
            make.bottom.equalTo(button.snp.top).offset(-15)
            make.centerX.equalToSuperview()
        }
        pendingIcon.snp.makeConstraints { make in
            make.bottom.equalTo(pendingLabel.snp.top).offset(-8)
            make.size.equalTo(42)
            make.centerX.equalToSuperview()
        }
    }
}

