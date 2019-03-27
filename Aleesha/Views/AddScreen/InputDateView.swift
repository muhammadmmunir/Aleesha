//
//  InputDateView.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 24/03/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import UIKit

class InputDateView: BaseView {
    
    // MARK: - Instance variables
    weak var alertDelegate: AddViewControllerDelegate?
    
    // MARK: - ContentView
    lazy var dateTextField: UITextField = {
        let textField = UITextField()
        
        let dateView = UIDatePicker()
        dateView.backgroundColor = .white
        dateView.datePickerMode = .date
        dateView.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
        
        textField.inputView = dateView
        textField.textColor = .gray
        textField.placeholder = "Pick a Date!"
        textField.font = UIFont.init(name: "AvenirNext-Regular", size: 16)
        textField.backgroundColor = .white
        textField.delegate = self
        return textField
    }()
    
    private lazy var bottomBorder: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.init(red: 248/255, green: 248/255, blue: 248/255, alpha: 1)
        return line
    }()
    
    private lazy var dateAccessoryView: CustomAccessoryView = {
        let accessory = CustomAccessoryView()
        accessory.delegate = self
        return accessory
    }()
    
    // MARK: - View customization
    override func setupViews() {
        backgroundColor = .white
        
        let contentView = [dateTextField, bottomBorder]
        contentView.forEach(addSubview)
        
        dateTextField.anchorWithSizeMultiplier(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, padding: UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 20), width: nil, height: heightAnchor, multiplier: CGSize(width: 0, height: 0.8))
        bottomBorder.anchor(top: dateTextField.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, padding: UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 20), size: CGSize(width: 0, height: 2))
        
        // setup accessoryView for dateTextField
        dateAccessoryView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: 50)
        dateTextField.inputAccessoryView = dateAccessoryView
    }
    
    // MARK: - Handle action for dateTextField
    @objc private func dateChanged(_ sender: UIDatePicker) {
        useDate(from: sender.date)
    }
    
    // MARK: - Helper method for handling dateTextField
    private func useDate(from date: Date) {
        let date = Calendar.current.dateComponents([.year, .month, .day], from: date)
        if let day = date.day, let month = date.month, let year = date.year {
            dateTextField.text = "\(month)/\(day)/\(year)"
        }
    }
    
}

// MARK: - UITextField delegate
extension InputDateView: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        useDate(from: Date())
        return true
    }
    
    // disable edit text in dateTextField
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }
    
}

// MARK: - CustomAccessoryView delegate
extension InputDateView: CustomAccessoryViewDelegate {
    
    func didButtonAccessoryTapped() {
        guard let dateIsEmpty = dateTextField.text?.isEmpty else {
            return
        }
        if dateIsEmpty  {
            alertDelegate?.alertInput(with: "You must filled the date input.")
        } else {
            dateTextField.resignFirstResponder()
        }  
    }
    
}
