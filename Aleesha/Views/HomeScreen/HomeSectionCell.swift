//
//  HomeSectionCell.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 13/03/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import UIKit

class HomeSectionCell: BaseCollectionViewCell {
    
    static let reuseIdentifier = "HomeSectionCell"
    
    var item: HomeSectionItem? {
        didSet{
            if let item = item {
                nameLabel.text = item.name
                categoryLabel.text = item.category
            }
        }
    }
    
    let container: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(rgb: 0x00E4B8)
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-Regular", size: 12)
        label.text = "Title."
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-Medium", size: 14)
        label.text = "School"
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    override func setupViews() {
        setupContainer()
        setupCategoryLabel()
        setupNameLabel()
    }
    
    private func setupContainer() {
        addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        container.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        container.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        container.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        container.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
    }
    
    private func setupCategoryLabel() {
        addSubview(categoryLabel)
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 10).isActive = true
        categoryLabel.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 10).isActive = true
        categoryLabel.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -10).isActive = true
    }
    
    private func setupNameLabel() {
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 10).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 10).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -10).isActive = true
    }
    
}
