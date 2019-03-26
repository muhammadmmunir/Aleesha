//
//  CustomAccessoryView.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 24/03/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import UIKit

protocol CustomAccessoryViewDelegate: class {
    func didButtonAccessoryTapped()
}

class CustomAccessoryView: BaseView {
    
    weak var delegate: CustomAccessoryViewDelegate?

    private lazy var accessoryButton: UIButton = {
        let button = UIButton(type: .custom)
        button.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        
        button.setTitle("DONE", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.init(name: "AvenirNext-Medium", size: 14)
        return button
    }()
    
    override func setupViews() {
        backgroundColor = .white
        setupAccessoryButtonShadow()
        setupAccessoryButton()
    }
    
    @objc private func dismissView() {
        delegate?.didButtonAccessoryTapped()
    }
    
    private func setupAccessoryButtonShadow() {
        // Setup for shadow effect on addButton
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2.0)
        layer.shadowRadius = 20.0
        layer.shadowOpacity = 0.15
    }
    
    private func setupAccessoryButton() {
        addSubview(accessoryButton)
        accessoryButton.translatesAutoresizingMaskIntoConstraints = false
        accessoryButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        accessoryButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        accessoryButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1).isActive = true
        accessoryButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
    }
    
}
