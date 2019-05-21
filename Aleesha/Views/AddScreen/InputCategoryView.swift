//
//  InputCategoryView.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 24/03/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import UIKit

class InputCategoryView: BaseView {
    
    // MARK: - Instance variables
    weak var alertDelegate: AddViewControllerDelegate?
    var categories = [TodoCategory]()

    // MARK: - ContentView
    lazy var categoryTextField: UITextField = {
        let textField = UITextField()
        
        let pickerView = UIPickerView()
        pickerView.backgroundColor = .white
        pickerView.delegate = self
        
        textField.inputView = pickerView
        textField.delegate = self
        textField.textColor = .gray
        textField.placeholder = "You need category, Click Me!"
        textField.font = UIFont.init(name: "AvenirNext-Regular", size: 16)
        textField.backgroundColor = .white
        return textField
    }()
    
    private lazy var bottomBorder: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.init(red: 248/255, green: 248/255, blue: 248/255, alpha: 1)
        return line
    }()
    
    private lazy var categoryAccessoryView: CustomAccessoryView = {
        let accessory = CustomAccessoryView()
        accessory.delegate = self
        return accessory
    }()
    
    // MARK: - View customization
    override func setupViews() {
        backgroundColor = .white
        
        let contentView = [categoryTextField, bottomBorder]
        contentView.forEach(addSubview)
        
        categoryTextField.anchorWithSizeMultiplier(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, padding: UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 20), width: nil, height: heightAnchor, multiplier: CGSize(width: 0, height: 0.8))
        bottomBorder.anchor(top: categoryTextField.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, padding: UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 20), size: CGSize(width: 0, height: 2))
        
        // setup accessoryView for categoryTextField
        categoryAccessoryView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: 50)
        categoryTextField.inputAccessoryView = categoryAccessoryView
    }
}

// MARK: - UIPickerView delegate and data source
extension InputCategoryView: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        categoryTextField.text = categories[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        // creating custom label for category PickerView
        var label = UILabel()
        
        if let view = view as? UILabel {
            label = view
        } else {
            label = UILabel()
        }
        
        label.font = UIFont.init(name: "AvenirNext-Medium", size: 16)
        label.textAlignment = .center
        label.text = categories[row].name
        
        return label
    }
}

// MARK: - UITextField delegate
extension InputCategoryView: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        categoryTextField.text = categories[0].name
        return true
    }
    
    // disable edit text in textfield
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }
}

// MARK: - CustomAccessoryView delegate
extension InputCategoryView: CustomAccessoryViewDelegate {
    
    func didButtonAccessoryTapped() {
        guard let categoryIsEmpty = categoryTextField.text?.isEmpty else {
            return
        }
        if categoryIsEmpty {
            alertDelegate?.alertInput(with: "You must filled the category input.")
        } else {
            categoryTextField.resignFirstResponder()
        }
    }
}
