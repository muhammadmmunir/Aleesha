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
        setupCloseButton()
        setupSaveButton()
    }
    
    private func setupCloseButton() {
        addSubview(closeButton)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.topAnchor.constraint(equalTo: margins.topAnchor, constant: 10).isActive = true
        closeButton.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: 35).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    private func setupSaveButton() {
        addSubview(saveButton)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.topAnchor.constraint(equalTo: margins.topAnchor, constant: 10).isActive = true
        saveButton.rightAnchor.constraint(equalTo: margins.rightAnchor, constant: -35).isActive = true
        saveButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    @objc private func closeAddView() {
        buttonDelegate?.didCloseButtonTapped()
    }

}
