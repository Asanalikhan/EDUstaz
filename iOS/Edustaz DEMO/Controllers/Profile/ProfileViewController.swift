//
//  ProfileViewController.swift
//  Edustaz DEMO
//
//  Created by Yernur Adilbek on 4/17/25.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        return view
    }()

    private lazy var profileBorderView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.cornerRadius = 32.5
        view.layer.borderWidth = 3
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showInfoView))
        view.addGestureRecognizer(tapGesture)
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private lazy var profileIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "profileIcon"))
        return imageView
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "user798809@gmail.com"
        label.font = .systemFont(ofSize: 11, weight: .regular)
        return label
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: ProfileTableViewCell.identifier)
        return tableView
    }()
    
    private lazy var bottomImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "wave"))
        imageView.backgroundColor = UIColor(red: 0.38, green: 0.24, blue: 0.97, alpha: 1.00)
        return imageView
    }()
    
    private let menuItems = [
        ("Материалдарым", "material", UIColor.lightGray),
        ("Курстарым", "course", UIColor.lightGray),
        ("Олимпиадаларым", "olympiad", UIColor.lightGray),
        ("Баптаулар", "gear", UIColor.white)
    ]
    
    private lazy var personalInfoView: PersonalInfoView = {
        let view = PersonalInfoView()
        view.isHidden = true
        return view
    }()
    
    private lazy var materialView: MaterialView = {
        let view = MaterialView()
        view.isHidden = true
        return view
    }()
    
    private lazy var olympiadView: OlympiadView = {
        let view = OlympiadView()
        view.isHidden = true
        return view
    }()
    
    private lazy var courseView: CourseView = {
        let view = CourseView()
        view.isHidden = true
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.97, green: 0.96, blue: 0.96, alpha: 1.00)
        setupUI()
    }
    
    //MARK: - Setup Table View
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.identifier, for: indexPath) as! ProfileTableViewCell
        cell.configure(title: menuItems[indexPath.row].0, icon: menuItems[indexPath.row].1, borderColor: menuItems[indexPath.row].2)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            show(selectedView: materialView)
        } else if indexPath.row == 1 {
            show(selectedView: courseView)
        } else if indexPath.row == 2 {
            show(selectedView: olympiadView)
        }else if indexPath.row == 3 {
            showLogoutAlert()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func showLogoutAlert() {
        let alert = UIAlertController(title: nil, message: "Аккаунттан шығуды растайсыз ба?", preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "Иа", style: .default) { _ in
            print("User confirmed logout")
        }
        
        let noAction = UIAlertAction(title: "Жоқ", style: .cancel, handler: nil)
        
        alert.addAction(yesAction)
        alert.addAction(noAction)
        
        alert.view.tintColor = UIColor.black
        
        present(alert, animated: true, completion: nil)
    }

    @objc func showInfoView() {
        containerView.isHidden.toggle()
        personalInfoView.isHidden.toggle()
    }
    
    func show(selectedView: UIView) {
        if let materialView = selectedView as? MaterialView {
            materialView.reloadTable()
        }
        containerView.isHidden.toggle()
        selectedView.isHidden.toggle()
    }
    


}

// MARK: - Setting UI Methods
private extension ProfileViewController {
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.addSubview(containerView)
        containerView.addSubview(profileBorderView)
        profileBorderView.addSubview(profileIcon)
        containerView.addSubview(emailLabel)
        containerView.addSubview(tableView)
        containerView.addSubview(bottomImageView)
        
        view.addSubview(personalInfoView)
        
        view.addSubview(materialView)
        view.addSubview(courseView)
        view.addSubview(olympiadView)
    }
    
    func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide).inset(10)
        }
        
        profileBorderView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(37)
            make.centerX.equalToSuperview()
            make.size.equalTo(65)
        }
        
        profileIcon.snp.makeConstraints { make in
            make.size.equalTo(45)
            make.center.equalToSuperview()
        }
        
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(profileBorderView.snp.bottom).offset(4)
            make.centerX.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(25)
            make.height.equalTo(352)
        }
        
        bottomImageView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(117)
        }
        
        personalInfoView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide).inset(10)
        }
        
        materialView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide).inset(10)
        }
        
        olympiadView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide).inset(10)
        }
        
        courseView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide).inset(10)
        }
    }
}

