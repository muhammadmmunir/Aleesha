//
//  HeaderBar.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 14/03/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import UIKit

class HeaderBar: BaseView {

    var titleText: String? {
        didSet{
            headerTitle.text = titleText
        }
    }
    
    private let headerTitle: UILabel = {
        let title = UILabel()
        title.font = UIFont.init(name: "AvenirNext-DemiBold", size: 22)
        title.textColor = .white
        title.text = "Awesome Title"
        title.numberOfLines = 0
        return title
    }()
    
    override func setupViews() {
        backgroundColor = UIColor(rgb: 0x00D1C4)
        layer.cornerRadius = 30
        layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        setupTitle()
    }
    
    private func setupTitle() {
        addSubview(headerTitle)
        headerTitle.translatesAutoresizingMaskIntoConstraints = false
        headerTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
        headerTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
    }

}
