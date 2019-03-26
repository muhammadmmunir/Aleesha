//
//  TodoCategoryCell.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 15/03/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import UIKit

class TodoCategoryCell: BaseCollectionViewCell {
    
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
    
    override func setupViews() {
        setupCategoryContainer()
        setupIconCategory()
        setupCategoryLabel()
        setupNumberOfTaskLabel()
    }
    
    private func setupCategoryContainer() {
        addSubview(categoryContainer)
        categoryContainer.translatesAutoresizingMaskIntoConstraints = false
        categoryContainer.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        categoryContainer.leftAnchor.constraint(equalTo: leftAnchor, constant: 5).isActive = true
        categoryContainer.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        categoryContainer.rightAnchor.constraint(equalTo: rightAnchor, constant: -5).isActive = true
    }
    
    func setupProgressLine() {
        categoryContainer.addSubview(progressLine)
        progressLine.translatesAutoresizingMaskIntoConstraints = false
        progressLine.topAnchor.constraint(equalTo: categoryContainer.topAnchor).isActive = true
        progressLine.leftAnchor.constraint(equalTo: categoryContainer.leftAnchor).isActive = true
        progressLine.heightAnchor.constraint(equalToConstant: 5).isActive = true
        progressLine.widthAnchor.constraint(equalTo: categoryContainer.widthAnchor, multiplier: progressLineMultiplier).isActive = true
    }
    
    private func setupIconCategory() {
        categoryContainer.addSubview(iconCategory)
        iconCategory.translatesAutoresizingMaskIntoConstraints = false
        iconCategory.topAnchor.constraint(equalTo: topAnchor, constant: 30).isActive = true
        iconCategory.leftAnchor.constraint(equalTo: categoryContainer.leftAnchor, constant: 20).isActive = true
        iconCategory.heightAnchor.constraint(equalTo: categoryContainer.heightAnchor, multiplier: 0.15).isActive = true
        iconCategory.widthAnchor.constraint(equalTo: categoryContainer.heightAnchor, multiplier: 0.15).isActive = true
    }
    
    private func setupCategoryLabel() {
        categoryContainer.addSubview(categoryLabel)
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.topAnchor.constraint(equalTo: iconCategory.bottomAnchor, constant: 25).isActive = true
        categoryLabel.leftAnchor.constraint(equalTo: categoryContainer.leftAnchor, constant: 20).isActive = true
    }
    
    private func setupNumberOfTaskLabel() {
        categoryContainer.addSubview(numberOfTaskLabel)
        numberOfTaskLabel.translatesAutoresizingMaskIntoConstraints = false
        numberOfTaskLabel.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 20).isActive = true
        numberOfTaskLabel.leftAnchor.constraint(equalTo: categoryContainer.leftAnchor, constant: 20).isActive = true
    }
}
