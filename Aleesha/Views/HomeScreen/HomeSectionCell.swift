//
//  HomeSectionCell.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 13/03/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import UIKit

class HomeSectionCell: BaseCollectionViewCell {
    
    // MARK: - Instance variables
    static let reuseIdentifier = "HomeSectionCell"
    var item: HomeSectionItem? {
        didSet{
            if let item = item {
                nameLabel.text = item.name
                categoryLabel.text = item.category
            }
        }
    }
    
    // MARK: - ContentView
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
    
    // MARK: - View customization
    override func setupViews() {
        let contentView = [container, categoryLabel, nameLabel]
        contentView.forEach(addSubview)
        
        container.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, padding: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        categoryLabel.anchor(top: container.topAnchor, left: container.leftAnchor, bottom: nil, right: container.rightAnchor, padding: UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10))
        nameLabel.anchor(top: categoryLabel.bottomAnchor, left: container.leftAnchor, bottom: nil, right: container.rightAnchor, padding: UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10))
    }
    
}
