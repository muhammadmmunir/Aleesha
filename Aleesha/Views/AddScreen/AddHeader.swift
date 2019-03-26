//
//  AddHeader.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 23/03/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import UIKit

class AddHeader: BaseView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.init(name: "AvenirNext-Medium", size: 24)
        label.textColor = .black
        label.textAlignment = .left
        label.text = "Add new task"
        return label
    }()
    
    override func setupViews() {
        backgroundColor = .white
        setupTitleLabel()
    }
    
    private func setupTitleLabel() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 35).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }

}
