//
//  TodoListTableViewCell.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 22/03/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import UIKit

class TodoListTableViewCell: UITableViewCell {
    
    // MARK: - Instance variables
    static let reuseIdentifier = "TodoListTableViewCell"
    var item: TodoItem? {
        didSet{
            if let item = item {
                titleLabel.text = item.title
            }
        }
    }
    
    // MARK: - ContentView
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
    
    // MARK: - View customization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        let subView = [statusImage, titleLabel]
        subView.forEach(addSubview)
        
        let paddingVertical = CGFloat(70 - 20) / 2
        
        statusImage.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, padding: UIEdgeInsets(top: paddingVertical, left: 35, bottom: paddingVertical, right: 0), size: CGSize(width: 20, height: 20))
        titleLabel.anchor(top: topAnchor, left: statusImage.rightAnchor, bottom: bottomAnchor, right: nil, padding: UIEdgeInsets(top: paddingVertical, left: 25, bottom: paddingVertical, right: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func changeTodoItem(from status: Bool, and title: String) {
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: title)
        if status {
            statusImage.image = UIImage(named: ICON.check)
            titleLabel.textColor = .lightGray
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
        } else {
            statusImage.image = UIImage(named: ICON.uncheck)
            titleLabel.textColor = .black
            
        }
        statusImage.alpha = 1
        titleLabel.attributedText = attributeString
    }

}
