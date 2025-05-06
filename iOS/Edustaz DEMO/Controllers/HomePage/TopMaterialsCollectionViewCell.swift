//
//  TopMaterialsCollectionViewCell.swift
//  Edustaz DEMO
//
//  Created by Yernur Adilbek on 3/21/25.
//

import UIKit
import SnapKit

class TopMaterialsCollectionViewCell: UICollectionViewCell {
    static let identifier = "CourseCollectionViewCell"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 8)
        label.textColor = UIColor(red: 0.28, green: 0.25, blue: 0.88, alpha: 1.00)
        label.numberOfLines = 2
        return label
    }()
    
    private let profileIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "profile"))
        return imageView
    }()
    
    private let authorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 6)
        label.textColor = .black
        return label
    }()
    
    private let downloadIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "download"))
        return imageView
    }()
    
    private let downloadCountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 6)
        label.textColor = UIColor(red: 0.38, green: 0.38, blue: 0.38, alpha: 1.00)
        return label
    }()
    
    private let viewIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "show"))
        return imageView
    }()
    
    private let viewCountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 6)
        label.textColor = UIColor(red: 0.38, green: 0.38, blue: 0.38, alpha: 1.00)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(title: String, author: String, downloads: Int, views: Int) {
        titleLabel.text = title
        authorLabel.text = author
        downloadCountLabel.text = "\(downloads)"
        viewCountLabel.text = "\(views)"
    }
}


// MARK: - setting iui methods
private extension TopMaterialsCollectionViewCell {
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        addSubview(titleLabel)
        addSubview(profileIcon)
        addSubview(authorLabel)
        
        addSubview(downloadCountLabel)
        addSubview(downloadIcon)
        
        addSubview(viewCountLabel)
        addSubview(viewIcon)
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(7)
        }
        
        profileIcon.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(16)
            make.leading.equalToSuperview().offset(7)
            make.height.width.equalTo(8)
        }
        
        authorLabel.snp.makeConstraints { make in
            make.top.equalTo(profileIcon)
            make.leading.equalTo(profileIcon.snp.trailing).offset(4)
        }
        
        viewIcon.snp.makeConstraints { make in
            make.top.equalTo(profileIcon)
            make.trailing.equalToSuperview().inset(16)
            make.height.width.equalTo(8)
        }
        
        viewCountLabel.snp.makeConstraints { make in
            make.top.equalTo(profileIcon)
            make.trailing.equalTo(viewIcon.snp.leading).offset(-2)
        }
        
        downloadIcon.snp.makeConstraints { make in
            make.trailing.equalTo(viewCountLabel.snp.leading).offset(-10)
            make.top.equalTo(profileIcon)
            make.height.width.equalTo(8)
        }
        
        downloadCountLabel.snp.makeConstraints { make in
            make.top.equalTo(profileIcon)
            make.trailing.equalTo(downloadIcon.snp.leading).offset(-2)
        }
    }
}

