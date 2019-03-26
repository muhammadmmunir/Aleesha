//
//  AddCustomNavBar.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 25/03/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import UIKit

class AddCustomNavBar: BaseView {
    
    weak var buttonDelegate: AddViewControllerDelegate?
    
    let closeButton: UIButton = {
        let closeIcon = UIImage(named: ICON.navBarClose)
        let button = UIButton(type: .custom)
        button.setImage(closeIcon, for: .normal)
        button.addTarget(self, action: #selector(closeAddView), for: .touchUpInside)
        button.tintColor = .lightGray
        return button
    }()
    
    let saveButton: UIButton = {
        let doneIcon = UIImage(named: ICON.navBarDone)
        let button = UIButton(type: .custom)
        button.setImage(doneIcon, for: .normal)
        button.tintColor = .lightGray
        return button
    }()

    override func setupViews() {
        backgroundColor = .white
        
        let contentView = [closeButton, saveButton]
        contentView.forEach(addSubview)
        
        closeButton.anchor(top: margins.topAnchor, left: margins.leftAnchor, bottom: nil, right: nil, padding: UIEdgeInsets(top: 10, left: 35, bottom: 0, right: 0), size: CGSize(width: 30, height: 30))
        saveButton.anchor(top: margins.topAnchor, left: nil, bottom: nil, right: margins.rightAnchor, padding: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 35), size: CGSize(width: 30, height: 30))
        
    }
    
    @objc private func closeAddView() {
        buttonDelegate?.didCloseButtonTapped()
    }

}
