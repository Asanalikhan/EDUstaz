//
//  UploadedMaterialTableViewCell.swift
//  Edustaz DEMO
//
//  Created by Yernur Adilbek on 4/26/25.
//

import UIKit

class UploadedMaterialTableViewCell: UITableViewCell {
    
    static let identifier = "UploadedMaterialTableViewCell"
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.layer.borderColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.00).cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10, weight: .light)
        label.textColor = UIColor(red: 0.28, green: 0.25, blue: 0.88, alpha: 1.00)
        return label
    }()
    
    private lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10, weight: .light)
        label.textColor = .black
        return label
    }()
    
    private lazy var gradeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10, weight: .light)
        label.textColor = .black
        return label
    }()
    
    private lazy var subjectLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10, weight: .light)
        label.textColor = .black
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = .none
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(material: Material) {
        titleLabel.text = material.title
        typeLabel.text = material.type
        gradeLabel.text = "\(material.grade)шы сынып"
        subjectLabel.text = material.subject
    }

}

// MARK: - Setting UI Methods
private extension UploadedMaterialTableViewCell {
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(typeLabel)
        containerView.addSubview(gradeLabel)
        containerView.addSubview(subjectLabel)
    }
    
    func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.top.equalToSuperview().inset(4)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.trailing.equalToSuperview().inset(19)
        }
        
        typeLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(19)
            make.top.equalTo(titleLabel.snp.bottom).offset(2)
        }
        
        gradeLabel.snp.makeConstraints { make in
            make.leading.equalTo(typeLabel.snp.trailing).offset(9)
            make.top.equalTo(titleLabel.snp.bottom).offset(2)
        }
        
        subjectLabel.snp.makeConstraints { make in
            make.leading.equalTo(gradeLabel.snp.trailing).offset(9)
            make.top.equalTo(titleLabel.snp.bottom).offset(2)
        }
    }
}

