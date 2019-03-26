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
        setupTitleLabel()
    }
    
    private func setupTitleLabel() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    func setTextLabel(with text: String) {
        titleLabel.text = text
    }

}
