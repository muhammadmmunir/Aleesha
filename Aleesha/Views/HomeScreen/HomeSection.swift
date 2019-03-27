//
//  HomeSection.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 10/03/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import UIKit

class HomeSection: BaseView {
    
    // MARK: - Instance variables
    var sectionItem = [HomeSectionItem]()
    var collectionViewCellColor: UIColor?
    
    // MARK: - ContentView
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
    
    // MARK: - View customization
    override func setupViews() {
        registerCustomViews()
        
        let contentView = [homeSectionLabel, homeCollectionView]
        contentView.forEach(addSubview)
        
        homeSectionLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, padding: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20))
        homeCollectionView.anchor(top: homeSectionLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, padding: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20))
    }
    
    private func registerCustomViews() {
        homeCollectionView.register(HomeSectionCell.self, forCellWithReuseIdentifier: HomeSectionCell.reuseIdentifier)
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
