//
//  ProfileTableViewCell.swift
//  Edustaz DEMO
//
//  Created by Yernur Adilbek on 4/18/25.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    static let identifier = "ProfileTableViewCell"
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    private lazy var chevronRight: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "chevron.right"))
        imageView.tintColor = .black
        return imageView
    }()
    
    private lazy var borderView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGroupedBackground
        return view
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
    
    func configure(title: String, icon: String, borderColor: UIColor){
        iconImageView.image = UIImage(named: icon)
        titleLabel.text = title
        borderView.backgroundColor = borderColor
    }

}


// MARK: - Setting UI Methods
private extension ProfileTableViewCell {
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        addSubview(iconImageView)
        addSubview(titleLabel)
        addSubview(chevronRight)
        addSubview(borderView)
    }
    
    func setupConstraints() {
        iconImageView.snp.makeConstraints { make in
            make.size.equalTo(25)
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(23)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        chevronRight.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-23)
            make.height.equalTo(20)
            make.width.equalTo(10)
            make.centerY.equalToSuperview()
        }
        
        borderView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}

