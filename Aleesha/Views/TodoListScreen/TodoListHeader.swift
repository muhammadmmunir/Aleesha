//
//  TodoListHeader.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 16/03/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import UIKit

class TodoListHeader: BaseView {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.init(name: "AvenirNext-Medium", size: 24)
        label.textColor = .black
        label.textAlignment = .left
        label.text = "Other"
        return label
    }()
    
    let titleIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = UIColor(rgb: 0x36D5FF)
        imageView.image = UIImage(named: ICON.categoryOther)
        return imageView
    }()
    
    let taskNumberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.init(name: "AvenirNext-Medium", size: 18)
        label.textColor = .gray
        label.text = "8 tasks"
        return label
    }()
    
    
    override func setupViews() {
        backgroundColor = .white
        setupTitleIcon()
        setupTitleLabel()
        setupTaskNumberLabel()
    }
    
    private func setupTitleIcon() {
        let imageWidth = CGFloat(25)
        let imageHeight = imageWidth
        let paddingVertical = CGFloat(50 - imageWidth) / 2
        
        addSubview(titleIcon)
        titleIcon.translatesAutoresizingMaskIntoConstraints = false
        titleIcon.topAnchor.constraint(equalTo: margins.topAnchor, constant: paddingVertical).isActive = true
        titleIcon.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: 35).isActive = true
        titleIcon.widthAnchor.constraint(equalToConstant: imageWidth).isActive = true
        titleIcon.heightAnchor.constraint(equalToConstant: imageHeight).isActive = true
    }
    
    private func setupTitleLabel() {
        let paddingVertical = CGFloat(50 - 25) / 2
        
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: margins.topAnchor, constant: paddingVertical).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: titleIcon.rightAnchor, constant: 15).isActive = true
    }
    
    private func setupTaskNumberLabel() {
        addSubview(taskNumberLabel)
        taskNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        taskNumberLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15).isActive = true
        taskNumberLabel.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: 75).isActive = true
    }

}
