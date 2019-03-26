//
//  TodoListTableViewCell.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 22/03/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import UIKit

class TodoListTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "TodoListTableViewCell"
    
    var item: TodoItem? {
        didSet{
            if let item = item {
                titleLabel.text = item.title
            }
        }
    }
    
    private let statusImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: ICON.uncheck))
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .lightGray
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.init(name: "AvenirNext-Medium", size: 16)
        label.textAlignment = .left
        return label
    }()
    
    func changeTodoItem(from status: Bool, and title: String) {
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: title)
        if status {
            statusImage.image = UIImage(named: ICON.check)
            statusImage.alpha = 1
            titleLabel.textColor = .lightGray
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
            titleLabel.attributedText = attributeString
        } else
        {
            statusImage.image = UIImage(named: ICON.uncheck)
            statusImage.alpha = 1
            titleLabel.textColor = .black
            titleLabel.attributedText = attributeString
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        setupStatusImage()
        setupTitleLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStatusImage() {
        let paddingVertical = CGFloat(70 - 20) / 2
        
        addSubview(statusImage)
        statusImage.translatesAutoresizingMaskIntoConstraints = false
        statusImage.topAnchor.constraint(equalTo: topAnchor, constant: paddingVertical).isActive = true
        statusImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 35).isActive = true
        statusImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -paddingVertical).isActive = true
        statusImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
        statusImage.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    private func setupTitleLabel() {
        let paddingVertical = CGFloat(70 - 20) / 2
        
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: paddingVertical).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: statusImage.rightAnchor, constant: 25).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -paddingVertical).isActive = true
    }

}
