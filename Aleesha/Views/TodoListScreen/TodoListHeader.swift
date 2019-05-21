//
//  TodoListHeader.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 16/03/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import UIKit

class TodoListHeader: BaseView {

    // MARK: - ContentView
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
    
    // MARK: - View customization
    override func setupViews() {
        backgroundColor = .white
        
        let contentView = [titleIcon, titleLabel, taskNumberLabel]
        contentView.forEach(addSubview)
        
        let imageWidth = CGFloat(25)
        let imageHeight = imageWidth
        let paddingVertical = CGFloat(50 - imageWidth) / 2
        
        titleIcon.anchor(top: margins.topAnchor, left: margins.leftAnchor, bottom: nil, right: nil, padding: UIEdgeInsets(top: paddingVertical, left: 35, bottom: 0, right: 0), size: CGSize(width: imageWidth, height: imageHeight))
        titleLabel.anchor(top: margins.topAnchor, left: titleIcon.rightAnchor, bottom: nil, right: nil, padding: UIEdgeInsets(top: paddingVertical, left: 15, bottom: 0, right: 0))
        taskNumberLabel.anchor(top: titleLabel.bottomAnchor, left: margins.leftAnchor, bottom: nil, right: nil, padding: UIEdgeInsets(top: 15, left: 75, bottom: 0, right: 0))
    }

}
