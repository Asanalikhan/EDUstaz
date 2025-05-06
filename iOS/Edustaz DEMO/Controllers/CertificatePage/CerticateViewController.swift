//
//  CerticateViewController.swift
//  Edustaz DEMO
//
//  Created by Yernur Adilbek on 3/18/25.
//

import UIKit

class CerticateViewController: BaseViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 7
        layout.minimumInteritemSpacing = 9
        layout.itemSize = CGSize(width: 180, height: 65)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CertificateCollectionViewCell.self, forCellWithReuseIdentifier: CertificateCollectionViewCell.identifier)
        
        return collectionView
    }()
    
    private lazy var certificateDescriptionView: CertificateDescriptionView = {
        let view = CertificateDescriptionView()
        view.isHidden = true
        view.onBackTapped = { [weak self] in
            self?.collectionView.isHidden = false
            self?.certificateDescriptionView.isHidden = true
        }
        return view
    }()
    
    let olympiadsArray = Olympiad.olympiadsData
    
//    let subjects = ["Тарих", "Математика", "Жаратылыстану", "Ағылшын тілі", "География", "Информатика", "Биология", "Қазақ тілі", "Дене шынықтыру", "Музыка", "Қазақстан тарихы", "Физика", "Еңбек", "Химия", "Психология", "Орыс тілі", "Педогогика", "Тексеру"]
//    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "Аттестация"
        setupUI()
    }
    

    //MARK: - Collection View Configurations
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return olympiadsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CertificateCollectionViewCell.identifier, for: indexPath) as! CertificateCollectionViewCell
        cell.configure(subject: olympiadsArray[indexPath.row].title)
        cell.backgroundColor = .white
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        certificateDescriptionView.configure(with: olympiadsArray[indexPath.row])
        collectionView.isHidden = true
        certificateDescriptionView.isHidden = false
    }
}

// MARK: - Setting UI Methods
private extension CerticateViewController {
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.addSubview(collectionView)
        view.addSubview(certificateDescriptionView)
    }
    
    func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(9)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-7)
            make.leading.trailing.equalToSuperview().inset(10)
        }
        
        certificateDescriptionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(10)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(8)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-18)
        }
    }
}

