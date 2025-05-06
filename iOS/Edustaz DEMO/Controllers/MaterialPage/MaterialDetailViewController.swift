//
//  MaterialDetailViewController.swift
//  Edustaz DEMO
//
//  Created by Yernur Adilbek on 5/2/25.
//

import UIKit

class MaterialDetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var material: Material?
    
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
    
    private lazy var detailView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        return view
    }()
    
    private lazy var detailTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.textColor = UIColor(red: 0.16, green: 0.53, blue: 0.20, alpha: 1.00)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var detailSubtitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private lazy var authorTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = .black
        label.textAlignment = .left
        label.text = "Авторы:"
        return label
    }()
    
    private lazy var authorIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile")
        return imageView
    }()
    
    private lazy var authorName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    private lazy var subjectView: UIButton = {
        let button = UIButton()
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor(red: 0.28, green: 0.25, blue: 0.88, alpha: 0.80).cgColor
        button.layer.cornerRadius = 5
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 9, weight: .regular)
//        button.backgroundColor = .white
        return button
    }()
    
    private lazy var typeView: UIButton = {
        let button = UIButton()
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor(red: 0.28, green: 0.25, blue: 0.88, alpha: 0.80).cgColor
        button.layer.cornerRadius = 5
        button.backgroundColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 9, weight: .regular)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private lazy var gradeView: UIButton = {
        let button = UIButton()
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor(red: 0.28, green: 0.25, blue: 0.88, alpha: 0.80).cgColor
        button.layer.cornerRadius = 5
        button.backgroundColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 9, weight: .regular)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private lazy var downloadButton: UIButton = {
        let button = UIButton()
        button.setTitle("Тегін жүктеу", for: .normal)
        button.backgroundColor = UIColor(red: 0.28, green: 0.25, blue: 0.88, alpha: 1.00)
        button.titleLabel?.font = .systemFont(ofSize: 13)
        button.layer.cornerRadius = 10
        return button
    }()
    
    private lazy var certificateView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        return view
    }()
    
    private lazy var certificateTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.textColor = UIColor(red: 0.16, green: 0.53, blue: 0.20, alpha: 1.00)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "Мақала жариялап аттестацияға жарамды тегін СЕРТИФИКАТ АЛЫҢЫЗ!"
        return label
    }()
    
    private lazy var certificateSubtitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .left
        label.text = "Қазақстан Республикасының білім беру жүйесін дамытуға қосқан жеке үлесі үшін және де Республика деңгейінде «EDUSTAZ» Республикалық ғылыми – әдістемелік журналының желілік басылымына өз авторлық материалыңызбен бөлісіп, белсенді болғаныңыз үшін алғыс білдіреміз!"
        return label
    }()
    
    private lazy var certificateImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "cert"))
        return imageView
    }()
    
    private lazy var uploadButton: UIButton = {
        let button = UIButton()
        button.setTitle("Жүктеу", for: .normal)
        button.backgroundColor = UIColor(red: 0.28, green: 0.25, blue: 0.88, alpha: 1.00)
        button.titleLabel?.font = .systemFont(ofSize: 13)
        button.layer.cornerRadius = 10
        return button
    }()
    
    
    
    
    private let topMaterials: [(title: String, author: String, downloads: Int, views: Int)] = [
            ("Балалардың сауат ашудағы танымдық қабілеттерінің даму деңгейі", "Сакен Серікұлы", 205, 909),
            ("Қысқаша көбейту формулалары", "Сакен Серікұлы", 713, 713),
            ("Қосу көбейту амалдары", "Сакен Серікұлы", 102, 401),
            ("Қысқаша көбейту формулалары", "Сакен Серікұлы", 58, 508)
        ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.97, green: 0.96, blue: 0.96, alpha: 1.00)
        setupUI()
        
        if let material = material {
            detailTitle.text = material.title
            detailSubtitle.text = "Шамалар арасындағы тәуелділіктерді берілу тәсілдері: аналитикалық (формула арқылы), кестелік, графиктік тәсіл"
            authorName.text = "Сакен Серікұлы"
            subjectView.setTitle(material.subject, for: .normal)
            typeView.setTitle(material.type, for: .normal)
            gradeView.setTitle("\(material.grade) сынып", for: .normal)
        }

        
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

}


// MARK: - Setting UI Methods
private extension MaterialDetailViewController {
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.addSubview(topTitleLabel)
        
        view.addSubview(collectionView)
        view.addSubview(leftChevronButton)
        view.addSubview(rightChevronButton)
        
        view.addSubview(detailView)
        detailView.addSubview(detailTitle)
        detailView.addSubview(detailSubtitle)
        detailView.addSubview(authorTitle)
        detailView.addSubview(authorIcon)
        detailView.addSubview(authorName)
        detailView.addSubview(subjectView)
        detailView.addSubview(typeView)
        detailView.addSubview(gradeView)
        detailView.addSubview(downloadButton)
        
        view.addSubview(certificateView)
        certificateView.addSubview(certificateTitle)
        certificateView.addSubview(certificateSubtitle)
        certificateView.addSubview(certificateImage)
        certificateView.addSubview(uploadButton)
        
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
        
        detailView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(220)
            make.top.equalTo(collectionView.snp.bottom).offset(16)
        }
        
        detailTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.trailing.equalToSuperview().inset(15)
        }
        
        detailSubtitle.snp.makeConstraints { make in
            make.leading.trailing.equalTo(detailTitle)
            make.top.equalTo(detailTitle.snp.bottom).offset(10)
        }
        
        authorTitle.snp.makeConstraints { make in
            make.top.equalTo(detailSubtitle.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(22)
        }
        
        authorIcon.snp.makeConstraints { make in
            make.top.equalTo(authorTitle.snp.bottom).offset(5)
            make.size.equalTo(25)
            make.leading.equalToSuperview().offset(22)
        }
        
        authorName.snp.makeConstraints { make in
            make.leading.equalTo(authorIcon.snp.trailing).offset(5)
            make.centerY.equalTo(authorIcon)
        }
        
        subjectView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(22)
            make.top.equalTo(authorIcon.snp.bottom).offset(12)
            make.width.equalTo(90)
            make.height.equalTo(23)
        }
        
        typeView.snp.makeConstraints { make in
            make.leading.equalTo(subjectView.snp.trailing).offset(21)
            make.top.equalTo(subjectView)
            make.width.equalTo(90)
            make.height.equalTo(23)
        }
        
        gradeView.snp.makeConstraints { make in
            make.leading.equalTo(typeView.snp.trailing).offset(21)
            make.top.equalTo(subjectView)
            make.width.equalTo(90)
            make.height.equalTo(23)
        }
        
        downloadButton.snp.makeConstraints { make in
            make.top.equalTo(subjectView.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(22)
            make.height.equalTo(35)
        }
        
        certificateView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(235)
            make.top.equalTo(detailView.snp.bottom).offset(12)
        }
        
        certificateTitle.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(17)
            make.top.equalToSuperview().offset(15)
        }
        
        certificateImage.snp.makeConstraints { make in
            make.top.equalTo(certificateTitle.snp.bottom).offset(22)
            make.height.equalTo(114)
            make.width.equalTo(88)
            make.trailing.equalToSuperview().offset(-12)
        }
        
        certificateSubtitle.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(17)
            make.trailing.equalTo(certificateImage.snp.leading).offset(-16)
            make.top.equalTo(certificateTitle.snp.bottom).offset(17)
        }
        
        uploadButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(100)
            make.bottom.equalToSuperview().offset(-9)
        }
    }
}

