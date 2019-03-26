//
//  InputDateView.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 24/03/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import UIKit

class InputDateView: BaseView {
    
    private var screenWidth: CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    weak var alertDelegate: AddViewControllerDelegate?
    
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
    
    override func setupViews() {
        backgroundColor = .white
        setupDateTextField()
        setupBottomBorder()
        setupDateAccessoryView()
    }
    
    private func setupDateTextField() {
        addSubview(dateTextField)
        dateTextField.translatesAutoresizingMaskIntoConstraints = false
        dateTextField.topAnchor.constraint(equalTo: topAnchor).isActive = true
        dateTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        dateTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        dateTextField.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8).isActive = true
    }
    
    private func setupBottomBorder() {
        addSubview(bottomBorder)
        bottomBorder.translatesAutoresizingMaskIntoConstraints = false
        bottomBorder.topAnchor.constraint(equalTo: dateTextField.bottomAnchor).isActive = true
        bottomBorder.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        bottomBorder.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        bottomBorder.heightAnchor.constraint(equalToConstant: 2).isActive = true
    }
    
    private func setupDateAccessoryView() {
        dateAccessoryView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: 50)
        dateTextField.inputAccessoryView = dateAccessoryView
    }
    
    @objc private func dateChanged(_ sender: UIDatePicker) {
        useDate(from: sender.date)
    }
    
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
    
    // disable edit text in textfield
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
