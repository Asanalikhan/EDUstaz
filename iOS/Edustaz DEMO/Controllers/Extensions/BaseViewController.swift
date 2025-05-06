//
//  BaseViewController.swift
//  Edustaz DEMO
//
//  Created by Yernur Adilbek on 4/17/25.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.97, green: 0.96, blue: 0.96, alpha: 1.00)
        
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        let leftButton = UIBarButtonItem(image: UIImage(named: "profile"), style: .plain, target: self, action: #selector(goToProfile))
        leftButton.tintColor = .black
        
        let rightButton = UIBarButtonItem(image: UIImage(named: "notification"), style: .plain, target: self, action: #selector(goToNotifications))
        rightButton.tintColor = .black
        
        navigationItem.leftBarButtonItem = leftButton
        navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc func goToProfile() {
        navigationController?.pushViewController(ProfileViewController(), animated: true)
    }
    
    @objc func goToNotifications() {
        navigationController?.pushViewController(NotificationsViewController(), animated: true)
    }
}

