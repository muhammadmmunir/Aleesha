//
//  CustomAccessoryView.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 24/03/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import UIKit

// MARK: - Accessory Protocol
protocol CustomAccessoryViewDelegate: class {
    func didButtonAccessoryTapped()
}

class CustomAccessoryView: BaseView {
    
    // MARK: - Instance variables
    weak var delegate: CustomAccessoryViewDelegate?

    // MARK: - ContentView
    private lazy var accessoryButton: UIButton = {
        let button = UIButton(type: .custom)
        button.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        
        button.setTitle("DONE", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.init(name: "AvenirNext-Medium", size: 14)
        return button
    }()
    
    // MARK: - View customization
    override func setupViews() {
        backgroundColor = .white
        setupAccessoryButtonShadow()
        
        let contentView = [accessoryButton]
        contentView.forEach(addSubview)
        
        accessoryButton.anchorWithCenterAndSizeMultiplier(top: nil, left: nil, bottom: nil, right: nil, vertical: centerYAnchor, horizontal: centerXAnchor, width: widthAnchor, height: heightAnchor, multiplier: CGSize(width: 1, height: 1))
    }

    private func setupAccessoryButtonShadow() {
        // Setup for shadow effect on addButton
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2.0)
        layer.shadowRadius = 20.0
        layer.shadowOpacity = 0.15
    }
    
    // MARK: - Accessory Delegation method
    @objc private func dismissView() {
        delegate?.didButtonAccessoryTapped()
    }
}
