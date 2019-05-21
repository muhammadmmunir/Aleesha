//
//  HeaderBar.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 14/03/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import UIKit

class HeaderBar: BaseView {

    // MARK: - Instance variables
    var titleText: String? {
        didSet{
            headerTitle.text = titleText
        }
    }
    
    // MARK: - ContentView
    private let headerTitle: UILabel = {
        let title = UILabel()
        title.font = UIFont.init(name: "AvenirNext-DemiBold", size: 22)
        title.textColor = .white
        title.text = "Awesome Title"
        title.numberOfLines = 0
        return title
    }()
    
    // MARK: - View customization
    override func setupViews() {
        backgroundColor = UIColor(rgb: 0x00D1C4)
        layer.cornerRadius = 30
        layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        addSubview(headerTitle)
        headerTitle.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: nil, padding: UIEdgeInsets(top: 0, left: 30, bottom: 20, right: 0))
    }

}
