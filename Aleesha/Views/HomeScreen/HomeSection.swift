//
//  HomeSection.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 10/03/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import UIKit

class HomeSection: BaseView {
    
    var sectionItem = [HomeSectionItem]()
    
    var collectionViewCellColor: UIColor?
    
    let homeSectionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-Medium", size: 20)
        label.text = "Section title"
        label.textColor = .black
        return label
    }()
    
    private lazy var homeCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.dataSource = self
        cv.delegate = self
        cv.isPrefetchingEnabled = false
        return cv
    }()
    
    private func registerCustomViews() {
        homeCollectionView.register(HomeSectionCell.self, forCellWithReuseIdentifier: HomeSectionCell.reuseIdentifier)
    }
    
    override func setupViews() {
        registerCustomViews()
        setupHomeSectionLabel()
        setupHomeCollectionView()
    }
    
    private func setupHomeSectionLabel() {
        addSubview(homeSectionLabel)
        homeSectionLabel.translatesAutoresizingMaskIntoConstraints = false
        homeSectionLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        homeSectionLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        homeSectionLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
    }
    
    private func setupHomeCollectionView() {
        addSubview(homeCollectionView)
        homeCollectionView.translatesAutoresizingMaskIntoConstraints = false
        homeCollectionView.topAnchor.constraint(equalTo: homeSectionLabel.bottomAnchor).isActive = true
        homeCollectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        homeCollectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        homeCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
}

// MARK: - Collection view data source and delegate

extension HomeSection: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionItem.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeSectionCell.reuseIdentifier, for: indexPath) as! HomeSectionCell
        cell.item = sectionItem[indexPath.row]
        cell.container.backgroundColor = collectionViewCellColor
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = homeCollectionView.frame.height
        let width = homeCollectionView.frame.width / 2
        return CGSize(width: width, height: height)
    }
    
}
