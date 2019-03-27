//
//  TodoCategoryCell.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 15/03/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import UIKit

class TodoCategoryCell: BaseCollectionViewCell {
    
    // MARK: - Instance variables
    static let reuseIdentifier = "TodoCategoryCell"
    var todoCategory: TodoCategory? {
        didSet{
            if let todoCategory = todoCategory {
                iconCategory.image = UIImage(named: todoCategory.icon)
                categoryLabel.text = todoCategory.name
                numberOfTaskLabel.text = "\(String(todoCategory.totalTask)) tasks"
                progressLineMultiplier = todoCategory.totalTask != 0 ? CGFloat(todoCategory.finishTask) / CGFloat(todoCategory.totalTask) : CGFloat(0)
            }
        }
    }
    private var progressLineMultiplier = CGFloat.init()
    
    // MARK: - ContentView
    private let categoryContainer: UIView = {
        let container = UIView()
        container.backgroundColor = UIColor(rgb: 0x36D5FF)
        container.layer.cornerRadius = 5
        container.layer.masksToBounds = true
        return container
    }()
    
    private let progressLine: UIView = {
        let line = UIView()
        line.backgroundColor = .gray
        return line
    }()
    
    private let iconCategory: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: ICON.categoryOther)!.withRenderingMode(.alwaysTemplate)
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .black
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-Medium", size: 14)
        label.text = "Other"
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    private let numberOfTaskLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-Medium", size: 12)
        label.text = "0 tasks"
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    // MARK: - View customization
    override func setupViews() {
        addSubview(categoryContainer)
        
        let contentView = [progressLine, iconCategory, categoryLabel, numberOfTaskLabel]
        contentView.forEach(categoryContainer.addSubview)
        
        categoryContainer.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, padding: UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5))
        iconCategory.anchorWithSizeMultiplier(top: topAnchor, left: categoryContainer.leftAnchor, bottom: nil, right: nil, padding: UIEdgeInsets(top: 30, left: 20, bottom: 0, right: 0), width: categoryContainer.widthAnchor, height: categoryContainer.heightAnchor, multiplier: CGSize(width: 0.15, height: 0.15))
        categoryLabel.anchor(top: iconCategory.bottomAnchor, left: categoryContainer.leftAnchor, bottom: nil, right: nil, padding: UIEdgeInsets(top: 25, left: 20, bottom: 0, right: 0))
        numberOfTaskLabel.anchor(top: categoryLabel.bottomAnchor, left: categoryContainer.leftAnchor, bottom: nil, right: nil, padding: UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 0))
    }
    
    func setupProgressLine() {
        progressLine.anchorWithSizeMultiplierAndConstant(top: categoryContainer.topAnchor, left: categoryContainer.leftAnchor, bottom: nil, right: nil, width: categoryContainer.widthAnchor, height: nil, multiplier: CGSize(width: progressLineMultiplier, height: 0), size: CGSize(width: 0, height: 5))
        categoryContainer.addSubview(progressLine)
    }
    
}
