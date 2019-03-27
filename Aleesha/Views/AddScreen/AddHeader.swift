//
//  AddHeader.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 23/03/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import UIKit

class AddHeader: BaseView {
    
    // MARK: - ContentView
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.init(name: "AvenirNext-Medium", size: 24)
        label.textColor = .black
        label.textAlignment = .left
        label.text = "Add new task"
        return label
    }()
    
    // MARK: - View customization
    override func setupViews() {
        backgroundColor = .white
        
        let contentView = [titleLabel]
        contentView.forEach(addSubview)
        
        titleLabel.anchorWithCenter(top: nil, left: leftAnchor, bottom: nil, right: nil, padding: UIEdgeInsets(top: 0, left: 35, bottom: 0, right: 0), vertical: centerYAnchor, horizontal: nil)
    }
    
}
