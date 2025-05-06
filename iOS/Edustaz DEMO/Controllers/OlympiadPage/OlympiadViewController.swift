//
//  OlympiadViewController.swift
//  Edustaz DEMO
//
//  Created by Yernur Adilbek on 3/18/25.
//

import UIKit

class OlympiadViewController: BaseViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    
    private lazy var segmentController: UISegmentedControl = {
        let segmentController = UISegmentedControl(items: ["Ұстаздарға", "Оқушыларға"])
        segmentController.selectedSegmentIndex = 0
        return segmentController
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 9
        layout.minimumInteritemSpacing = 14
        layout.itemSize = CGSize(width: 110, height: 110)
        
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(OlympiadCollectionViewCell.self, forCellWithReuseIdentifier: OlympiadCollectionViewCell.identifier)
        
        return collectionView
    }()
    let olympiadsArray = Olympiad.olympiadsData
    
    private lazy var olympiadDescriptionView: OlympiadDescriptionView = {
        let view = OlympiadDescriptionView()
        view.isHidden = true
        view.onBackTapped = { [weak self] in
            self?.collectionView.isHidden = false
            self?.olympiadDescriptionView.isHidden = true
        }
        return view
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.97, green: 0.96, blue: 0.96, alpha: 1.00)
        
        self.navigationItem.title = "Олимпиада"
        setupUI()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return olympiadsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OlympiadCollectionViewCell.identifier, for: indexPath) as! OlympiadCollectionViewCell
        cell.configure(olympiad: olympiadsArray[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedOlympiad = olympiadsArray[indexPath.item]
        
        switch segmentController.titleForSegment(at: segmentController.selectedSegmentIndex)! {
        case "Ұстаздарға":
            olympiadDescriptionView.configure(with: selectedOlympiad, for: "Ұстаздар")
        case "Оқушыларға":
            olympiadDescriptionView.configure(with: selectedOlympiad, for: "Оқушылар")
        default:
            return
        }
        
        olympiadDescriptionView.isHidden = false
        collectionView.isHidden = true
    }


}



// MARK: - setting iui methods
private extension OlympiadViewController {
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.addSubview(segmentController)
        view.addSubview(collectionView)
        view.addSubview(olympiadDescriptionView)
        olympiadDescriptionView.isHidden = true
    }
    
    func setupConstraints() {
        segmentController.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(51)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(segmentController.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(10)
        }
        
        olympiadDescriptionView.snp.makeConstraints { make in
            make.top.equalTo(segmentController.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(10)
        }

    }
}

