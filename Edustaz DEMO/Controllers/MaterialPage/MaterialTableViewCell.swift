//
//  MaterialTableViewCell.swift
//  Edustaz DEMO
//
//  Created by Yernur Adilbek on 3/26/25.
//

import UIKit

class MaterialTableViewCell: UITableViewCell {
    static let identifier = "MaterialTableViewCell"
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        label.textColor = UIColor(red: 0.28, green: 0.25, blue: 0.88, alpha: 1.00)
        return label
    }()
    
    private lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    private lazy var gradeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    private lazy var subjectLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
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

// MARK: - setting iui methods
private extension MaterialTableViewCell {
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
            make.leading.trailing.top.equalToSuperview()
            make.bottom.equalToSuperview().offset(-8)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.leading.trailing.equalToSuperview().inset(15)
        }
        
        typeLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
        }
        
        gradeLabel.snp.makeConstraints { make in
            make.leading.equalTo(typeLabel.snp.trailing).offset(9)
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
        }
        
        subjectLabel.snp.makeConstraints { make in
            make.leading.equalTo(gradeLabel.snp.trailing).offset(9)
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
        }
    }
}

