//
//  InputTitleView.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 23/03/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import UIKit

class InputTitleView: BaseView {
    
    weak var alertDelegate: AddViewControllerDelegate?

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
    
    override func setupViews() {
        backgroundColor = .white
        setupInputTitle()
        setupBottomBorder()
        setupInputAccessoryView()
    }
    
    private func setupInputTitle() {
        addSubview(inputTitle)
        inputTitle.translatesAutoresizingMaskIntoConstraints = false
        inputTitle.topAnchor.constraint(equalTo: topAnchor).isActive = true
        inputTitle.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        inputTitle.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        inputTitle.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8).isActive = true
    }
    
    private func setupBottomBorder() {
        addSubview(bottomBorder)
        bottomBorder.translatesAutoresizingMaskIntoConstraints = false
        bottomBorder.topAnchor.constraint(equalTo: inputTitle.bottomAnchor).isActive = true
        bottomBorder.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        bottomBorder.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        bottomBorder.heightAnchor.constraint(equalToConstant: 2).isActive = true
    }
    
    private func setupInputAccessoryView() {
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
