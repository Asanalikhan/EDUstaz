//
//  HomeViewController.swift
//  Edustaz DEMO
//
//  Created by Yernur Adilbek on 3/18/25.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private lazy var topTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 17)
        label.textAlignment = .center
        label.text = "Үздік материалдар"
        return label
    }()
    
    private lazy var leftChevronButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(scrollLeft), for: .touchUpInside)
        return button
    }()
    
    private lazy var rightChevronButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(scrollRight), for: .touchUpInside)
        return button
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 12
        layout.itemSize = CGSize(width: 300, height: 120)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(TopMaterialsCollectionViewCell.self, forCellWithReuseIdentifier: TopMaterialsCollectionViewCell.identifier)
        
        return collectionView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var countdownView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        return view
    }()
    
    private let countdownStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    private var targetDate: Date = {
        var components = DateComponents()
        components.year = 2025
        components.month = 4
        components.day = 1
        components.hour = 0
        components.minute = 0
        components.second = 0
        return Calendar.current.date(from: components) ?? Date()
    }()
    
    private lazy var countdownTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Наурыз айының зияткерлік олимпиядасы"
        label.textColor = UIColor(red: 0.16, green: 0.53, blue: 0.20, alpha: 1.00)
        label.font = .systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    private lazy var countdownTimerLabel: UILabel = {
        let label = UILabel()
        label.text = "Олимпиаданың бітуіне қалды:"
        label.textColor = .black
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    private lazy var rocketIcon: UIImageView = {
        let imageview = UIImageView(image: UIImage(named: "rocket"))
        return imageview
    }()
    
    private lazy var descriptionView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        return view
    }()
    
    private lazy var descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "EDUSTAZ"
        label.textColor = UIColor(red: 0.16, green: 0.53, blue: 0.20, alpha: 1.00)
        label.font = .systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Порталда педагогтар бір-бірімен шексіз тәжірибе алмасуына барлық жағдай жасалған. Педагогтарға керекті біліктілікті арттыру курстары, семинарлар, ашық сабақтар жинағы, жаңалықтар, олимпиадалар мен 350 000 астам материалдар базасы жинақталған"
        label.font = .systemFont(ofSize: 12)
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    
    private var countdownLabels: [UILabel] = [UILabel(), UILabel(), UILabel(), UILabel()]
    let countdownTitles = ["Күн", "Сағат", "Минут", "Секунд"]
    
    private let topMaterials: [(title: String, author: String, downloads: Int, views: Int)] = [
            ("Балалардың сауат ашудағы танымдық қабілеттерінің даму деңгейі", "Сакен Серікұлы", 713, 713),
            ("Қысқаша көбейту формулалары", "Сакен Серікұлы", 713, 713),
            ("Қысқаша көбейту формулалары", "Сакен Серікұлы", 713, 713),
            ("Қысқаша көбейту формулалары", "Сакен Серікұлы", 713, 713)
        ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.97, green: 0.96, blue: 0.96, alpha: 1.00)
        
        title = "Басты Бет"
        setupUI()
        setupTabViews()
        setupCountdownView()
        startTimer()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }

    //MARK: - Setting up tab views
    func setupTabViews() {
        let row1 = createHorizontalStack()
        let row2 = createHorizontalStack()
        
        let button1 = TabView()
        button1.configure(with: UIImage(named: "certificate"), title: "Аттестацияға дайындық")
        
        let button2 = TabView()
        button2.configure(with: UIImage(named: "course"), title: "Курстар")
        
        let button3 = TabView()
        button3.configure(with: UIImage(named: "material"), title: "Материалдар")
        
        let button4 = TabView()
        button4.configure(with: UIImage(named: "olympiad"), title: "Олимпиада")
        
        row1.addArrangedSubview(button1)
        row1.addArrangedSubview(button2)
        
        row2.addArrangedSubview(button3)
        row2.addArrangedSubview(button4)
        
        stackView.addArrangedSubview(row1)
        stackView.addArrangedSubview(row2)
        
        [button1, button2, button3, button4].forEach { button in
            button.snp.makeConstraints { make in
                make.width.equalTo(165)
                make.height.equalTo(75)
            }
        }
    }
    
    private func createHorizontalStack() -> UIStackView {
       let stack = UIStackView()
       stack.axis = .horizontal
       stack.spacing = 20
       stack.distribution = .fillEqually
       return stack
   }
    
    //MARK: - Setting up navigation bar
    func setupNavigationBar() {
        let leftButton = UIBarButtonItem(image: UIImage(named: "profile"), style: .plain, target: self, action: #selector(scrollLeft))
        leftButton.tintColor = .black

        let rightButton = UIBarButtonItem(image: UIImage(named: "notification"), style: .plain, target: self, action: #selector(scrollRight))
        rightButton.tintColor = .black

        navigationItem.leftBarButtonItem = leftButton
        navigationItem.rightBarButtonItem = rightButton
    }

    // MARK: - Collection View Navigation
    @objc private func scrollLeft() {
        let visibleItems = collectionView.indexPathsForVisibleItems.sorted()
        guard let firstVisibleItem = visibleItems.first else { return }
        let previousItem = max(firstVisibleItem.item - 1, 0)
        let indexPath = IndexPath(item: previousItem, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .right, animated: true)
    }
    
    @objc private func scrollRight() {
        let visibleItems = collectionView.indexPathsForVisibleItems.sorted()
        print(visibleItems)
        guard let lastVisibleItem = visibleItems.last else { return }
        let nextItem = min(lastVisibleItem.item + 1, topMaterials.count - 1)
        let indexPath = IndexPath(item: nextItem, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
    }
    
    // MARK: UICollectionView DataSource & Delegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topMaterials.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopMaterialsCollectionViewCell.identifier, for: indexPath) as! TopMaterialsCollectionViewCell
        let course = topMaterials[indexPath.item]
        cell.configure(title: course.title, author: course.author, downloads: course.downloads, views: course.views)
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 5
        cell.clipsToBounds = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 65)
    }
    
    
    //MARK: - Setting up countdown view
    func setupCountdownView() {
        countdownLabels = []
        
        
        for title in countdownTitles {
            let container = UIView()
            container.backgroundColor = UIColor(red: 0.28, green: 0.25, blue: 0.88, alpha: 1.00)
            container.layer.cornerRadius = 10
            container.clipsToBounds = true
            
            let numberLabel = UILabel()
            numberLabel.text = "--"
            numberLabel.font = UIFont.boldSystemFont(ofSize: 12)
            numberLabel.textColor = .white
            numberLabel.textAlignment = .center
            
            let textLabel = UILabel()
            textLabel.text = title
            textLabel.font = UIFont.systemFont(ofSize: 12)
            textLabel.textColor = .white
            textLabel.textAlignment = .center
            
            container.addSubview(numberLabel)
            container.addSubview(textLabel)
            countdownStackView.addArrangedSubview(container)
            
            countdownLabels.append(numberLabel)
            
            container.snp.makeConstraints { make in
                make.width.height.equalTo(45)
            }
            
            numberLabel.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(9)
                make.centerX.equalToSuperview()
            }
            
            textLabel.snp.makeConstraints { make in
                make.top.equalTo(numberLabel.snp.bottom).offset(1)
                make.centerX.equalToSuperview()
            }
        }
        
    }
    
    private func startTimer() {
        updateCountdown()
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCountdown), userInfo: nil, repeats: true)
    }
    
    @objc private func updateCountdown() {
        let now = Date()
        let timeLeft = targetDate.timeIntervalSince(now)
        
        if timeLeft <= 0 {
            countdownLabels.forEach { $0.text = "00" }
            return
        }
        
        let days = Int(timeLeft) / 86400
        let hours = (Int(timeLeft) % 86400) / 3600
        let minutes = (Int(timeLeft) % 3600) / 60
        let seconds = Int(timeLeft) % 60
        
        let values = [days, hours, minutes, seconds]
        
        DispatchQueue.main.async {
            for (index, value) in values.enumerated() {
                self.countdownLabels[index].text = String(format: "%02d", value)
            }
        }
    }

}

// MARK: - setting iui methods
private extension HomeViewController {
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.addSubview(topTitleLabel)
        
        view.addSubview(collectionView)
        view.addSubview(leftChevronButton)
        view.addSubview(rightChevronButton)
        
        view.addSubview(stackView)
        
        view.addSubview(countdownView)
        countdownView.addSubview(countdownTitleLabel)
        countdownView.addSubview(countdownTimerLabel)
        countdownView.addSubview(countdownStackView)
        countdownView.addSubview(rocketIcon)
        
        view.addSubview(descriptionView)
        descriptionView.addSubview(descriptionTitleLabel)
        descriptionView.addSubview(descriptionLabel)
    }
    
    func setupConstraints() {
        topTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(13)
            make.centerX.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(topTitleLabel.snp.bottom).offset(16)
            make.leading.equalTo(leftChevronButton.snp.trailing).offset(6)
            make.trailing.equalTo(rightChevronButton.snp.leading).offset(6)
            make.height.equalTo(65)
        }
        
        leftChevronButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(7)
            make.centerY.equalTo(collectionView)
        }
        
        rightChevronButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-7)
            make.centerY.equalTo(collectionView)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(19)
            make.centerX.equalToSuperview()
        }
        
        countdownView.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(17)
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(150)
        }
        
        countdownTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(19)
            make.centerX.equalToSuperview()
        }
        
        countdownTimerLabel.snp.makeConstraints { make in
            make.top.equalTo(countdownTitleLabel.snp.bottom).offset(9)
            make.leading.equalTo(countdownTitleLabel)
        }
        
        countdownStackView.snp.makeConstraints { make in
            make.top.equalTo(countdownTimerLabel.snp.bottom).offset(25)
            make.leading.equalTo(countdownTitleLabel)
        }
        
        rocketIcon.snp.makeConstraints { make in
            make.top.equalTo(countdownTitleLabel.snp.bottom).offset(11)
            make.trailing.equalToSuperview().offset(-34)
            make.width.height.equalTo(75)
        }
        
        descriptionView.snp.makeConstraints { make in
            make.top.equalTo(countdownView.snp.bottom).offset(18)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(157)
            make.centerX.equalToSuperview()
        }
        
        descriptionTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(18)
            make.centerX.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(descriptionTitleLabel.snp.bottom).offset(12)
            make.leading.trailing.equalToSuperview().inset(7)
        }
    }
}
