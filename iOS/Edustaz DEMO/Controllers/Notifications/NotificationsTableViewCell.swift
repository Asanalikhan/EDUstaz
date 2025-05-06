//
//  NotificationsTableViewCell.swift
//  Edustaz DEMO
//
//  Created by Yernur Adilbek on 4/17/25.
//

import UIKit

class NotificationsTableViewCell: UITableViewCell {
    
    static let identifier = "NotificationsTableViewCell"
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "notificationIcon")
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.16, green: 0.53, blue: 0.20, alpha: 1.00)
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
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
    
    func configure(with notification: MyNotification){
        titleLabel.text = notification.title
        subTitleLabel.text = notification.subtitle
        timeLabel.text = notification.time
    }

}


// MARK: - Setting UI Methods
private extension NotificationsTableViewCell {
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        addSubview(containerView)
        
        containerView.addSubview(iconImageView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(subTitleLabel)
        containerView.addSubview(timeLabel)
    }
    
    func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-6)
        }
        iconImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(22)
            make.top.equalToSuperview().offset(14)
            make.height.width.equalTo(40)
        }
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(iconImageView.snp.trailing).offset(16)
            make.top.equalTo(iconImageView)
        }
        subTitleLabel.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel)
            make.top.equalTo(titleLabel.snp.bottom).offset(6)
            make.trailing.equalToSuperview().offset(-70)
//            make.bottom.equalToSuperview().offset(-14)
        }
        timeLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-22)
            make.top.equalToSuperview().offset(15)
        }
    }
}

