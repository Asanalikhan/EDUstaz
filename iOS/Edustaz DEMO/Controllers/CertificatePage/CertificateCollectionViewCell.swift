//
//  CertificateCollectionViewCell.swift
//  Edustaz DEMO
//
//  Created by Yernur Adilbek on 4/24/25.
//

import UIKit

class CertificateCollectionViewCell: UICollectionViewCell {
    static let identifier = "CertificateCollectionViewCell"
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    private lazy var moreView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.28, green: 0.25, blue: 0.88, alpha: 1.00)
        view.layer.cornerRadius = 5
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var moreLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10, weight: .regular)
        label.textColor = .white
        label.text = "Толығырақ"
        return label
    }()
    
    private lazy var moreChevronImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "chevron.right"))
        imageView.tintColor = .white
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(subject: String) {
        titleLabel.text = subject
    }
    
    
}


// MARK: - Setting UI Methods
private extension CertificateCollectionViewCell {
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        addSubview(titleLabel)
        addSubview(moreView)
        moreView.addSubview(moreLabel)
        moreView.addSubview(moreChevronImageView)
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(28)
            make.top.equalToSuperview().offset(23)
        }
        
        moreView.snp.makeConstraints { make in
            make.width.equalTo(90)
            make.height.equalTo(20)
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        moreLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }
        
        moreChevronImageView.snp.makeConstraints { make in
            make.leading.equalTo(moreLabel.snp.trailing).offset(5)
            make.height.equalTo(14)
            make.width.equalTo(8)
            make.centerY.equalTo(moreLabel)
        }
    }
}

