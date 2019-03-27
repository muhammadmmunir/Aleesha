//
//  InputTitleView.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 23/03/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import UIKit

class InputTitleView: BaseView {
    
    // MARK: - Instance variables
    weak var alertDelegate: AddViewControllerDelegate?

    // MARK: - ContentView
    lazy var inputTitle: UITextField = {
        let input = UITextField()
        input.placeholder = "Enter a new task"
        input.font = UIFont.init(name: "AvenirNext-Regular", size: 16)
        input.autocorrectionType = .no
        input.keyboardType = .alphabet
        input.clearButtonMode = .whileEditing
        input.contentVerticalAlignment = .center
        input.delegate = self
        input.textColor = .gray
        return input
    }()
    
    private lazy var bottomBorder: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.init(red: 248/255, green: 248/255, blue: 248/255, alpha: 1)
        return line
    }()
    
    private lazy var titleAccessoryView: CustomAccessoryView = {
        let accessory = CustomAccessoryView()
        accessory.delegate = self
        return accessory
    }()
    
    // MARK: - View customization
    override func setupViews() {
        backgroundColor = .white
        
        let contentView = [inputTitle, bottomBorder]
        contentView.forEach(addSubview)
        
        inputTitle.anchorWithSizeMultiplier(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, padding: UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 20), width: nil, height: heightAnchor, multiplier: CGSize(width: 0, height: 0.8))
        bottomBorder.anchor(top: inputTitle.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, padding: UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 20), size: CGSize(width: 0, height: 2))
        
        // setup accessoryView for inputTitle
        titleAccessoryView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: 50)
        inputTitle.inputAccessoryView = titleAccessoryView
    }
}

// MARK: - UITextField delegate
extension InputTitleView: UITextFieldDelegate {
    
    // execute after done button is press
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //        print("TextField should return method called")
        textField.resignFirstResponder();
        return true;
    }
    
}

// MARK: - CustomAccessoryView delegate
extension InputTitleView: CustomAccessoryViewDelegate {
    
    func didButtonAccessoryTapped() {
        guard let titleIsEmpty = inputTitle.text?.isEmpty else {
            return
        }
        if titleIsEmpty {
            alertDelegate?.alertInput(with: "You must filled the title input.")
        } else {
            inputTitle.resignFirstResponder()
        }
    }
    
}
