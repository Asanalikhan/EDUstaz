//
//  CourseViewController.swift
//  Edustaz DEMO
//
//  Created by Yernur Adilbek on 3/18/25.
//

import UIKit

class CourseViewController: BaseViewController {
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "pending"))
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.text = "Болашақта бұл функция қосылады"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "Курс"
        
        view.addSubview(iconImageView)
        view.addSubview(titleLabel)
        
        iconImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(titleLabel.snp.top).offset(-10)
            make.size.equalTo(42)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }


}


