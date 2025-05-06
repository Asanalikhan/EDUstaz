//
//  OlympiadCollectionViewCell.swift
//  Edustaz DEMO
//
//  Created by Yernur Adilbek on 4/9/25.
//

import UIKit

class OlympiadCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "OlympiadCollectionViewCell"
    
    private lazy var imageview: UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFill
        imageview.clipsToBounds = true
        return imageview
    }()
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 5
        contentView.clipsToBounds = true
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(olympiad: Olympiad) {
        imageview.image = UIImage(named: olympiad.imageView)
        title.text = olympiad.title
    }
}

// MARK: - setting ui methods
private extension OlympiadCollectionViewCell {
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        addSubview(imageview)
        addSubview(title)
    }
    
    func setupConstraints() {
        imageview.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(11)
            make.size.equalTo(54)
        }
        
        title.snp.makeConstraints { make in
            make.top.equalTo(imageview.snp.bottom).offset(6)
            make.trailing.equalToSuperview().offset(-18)
            make.leading.equalToSuperview().offset(8)
        }
    }
}

