//
//  InputLabelView.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 24/03/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import UIKit

class InputLabelView: BaseView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.init(name: "AvenirNext-Regular", size: 16)
        label.textColor = .black
        label.textAlignment = .left
        label.text = "Item"
        return label
    }()

    override func setupViews() {
        backgroundColor = .white
        
        let contentView = [titleLabel]
        contentView.forEach(addSubview)
        
        titleLabel.anchorWithCenter(top: nil, left: leftAnchor, bottom: nil, right: nil, padding: UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0), vertical: centerYAnchor, horizontal: nil)
        
    }
    
    func setTextLabel(with text: String) {
        titleLabel.text = text
    }

}
