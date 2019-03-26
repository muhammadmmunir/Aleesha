//
//  AddRootContainer.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 23/03/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import UIKit

class AddRootContainer: BaseView {
    
    lazy var navBar: AddCustomNavBar = {
        let navbar = AddCustomNavBar()
        return navbar
    }()

    private lazy var header: AddHeader = {
        let header = AddHeader()
        return header
    }()
    
    private lazy var titleLabelView: InputLabelView = {
        let label = InputLabelView()
        label.setTextLabel(with: "Title")
        return label
    }()
    
    lazy var inputTitleView: InputTitleView = {
        let title = InputTitleView()
        return title
    }()
    
    private lazy var categoryLabelView: InputLabelView = {
        let label = InputLabelView()
        label.setTextLabel(with: "Category")
        return label
    }()
    
    lazy var inputCategoryView: InputCategoryView = {
        let category = InputCategoryView()
        return category
    }()
    
    private lazy var dateLabelView: InputLabelView = {
        let label = InputLabelView()
        label.setTextLabel(with: "Date")
        return label
    }()
    
    lazy var inputDateView: InputDateView = {
        let date = InputDateView()
        return date
    }()
    
    override func setupViews() {
        backgroundColor = .white
        
        let contentView = [navBar, header, titleLabelView, inputTitleView, categoryLabelView, inputCategoryView, dateLabelView, inputDateView]
        
        // add customView to this view
        contentView.forEach(addSubview)
        
        navBar.anchor(top: margins.topAnchor, left: margins.leftAnchor, bottom: nil, right: margins.rightAnchor, size: CGSize(width: 0, height: 44))
        header.anchorWithSizeMultiplier(top: navBar.bottomAnchor, left: margins.leftAnchor, bottom: nil, right: margins.rightAnchor, width: nil, height: heightAnchor, multiplier: CGSize.init(width: 0, height: 0.15))
        titleLabelView.anchor(top: header.bottomAnchor, left: margins.leftAnchor, bottom: nil, right: margins.rightAnchor, size: CGSize(width: 0, height: 50))
        inputTitleView.anchor(top: titleLabelView.bottomAnchor, left: margins.leftAnchor, bottom: nil, right: margins.rightAnchor, size: CGSize(width: 0, height: 60))
        categoryLabelView.anchor(top: inputTitleView.bottomAnchor, left: margins.leftAnchor, bottom: nil, right: margins.rightAnchor, size: CGSize(width: 0, height: 50))
        inputCategoryView.anchor(top: categoryLabelView.bottomAnchor, left: margins.leftAnchor, bottom: nil, right: margins.rightAnchor, size: CGSize(width: 0, height: 60))
        dateLabelView.anchor(top: inputCategoryView.bottomAnchor, left: margins.leftAnchor, bottom: nil, right: margins.rightAnchor, size: CGSize(width: 0, height: 50))
        dateLabelView.anchor(top: inputCategoryView.bottomAnchor, left: margins.leftAnchor, bottom: nil, right: margins.rightAnchor, size: CGSize(width: 0, height: 50))
//        setupNavBar()
//        setupHeader()
//        setupTitleLabelView()
//        setupInputTitleView()
//        setupCategoryLabelView()
//        setupInputCategoryView()
//        setupDateLabelView()
//        setupInputDateView()
    }
    
    private func setupNavBar() {
        addSubview(navBar)
        navBar.anchor(top: margins.topAnchor, left: margins.leftAnchor, bottom: nil, right: margins.rightAnchor, size: CGSize(width: 0, height: 44))
//        navBar.translatesAutoresizingMaskIntoConstraints = false
//        navBar.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
//        navBar.leftAnchor.constraint(equalTo: margins.leftAnchor).isActive = true
//        navBar.rightAnchor.constraint(equalTo: margins.rightAnchor).isActive = true
//        navBar.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
    private func setupHeader() {
        addSubview(header)
        header.anchorWithSizeMultiplier(top: navBar.bottomAnchor, left: margins.leftAnchor, bottom: nil, right: margins.rightAnchor, width: nil, height: heightAnchor, multiplier: CGSize.init(width: 0, height: 0.15))
//        header.translatesAutoresizingMaskIntoConstraints = false
//        header.topAnchor.constraint(equalTo: navBar.bottomAnchor).isActive = true
//        header.leftAnchor.constraint(equalTo: margins.leftAnchor).isActive = true
//        header.rightAnchor.constraint(equalTo: margins.rightAnchor).isActive = true
//        header.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15).isActive = true
    }
    
    private func setupTitleLabelView() {
        addSubview(titleLabelView)
        titleLabelView.anchor(top: header.bottomAnchor, left: margins.leftAnchor, bottom: nil, right: margins.rightAnchor, size: CGSize(width: 0, height: 50))
//        titleLabelView.translatesAutoresizingMaskIntoConstraints = false
//        titleLabelView.topAnchor.constraint(equalTo: header.bottomAnchor).isActive = true
//        titleLabelView.leftAnchor.constraint(equalTo: margins.leftAnchor).isActive = true
//        titleLabelView.rightAnchor.constraint(equalTo: margins.rightAnchor).isActive = true
//        titleLabelView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func setupInputTitleView() {
        addSubview(inputTitleView)
        inputTitleView.anchor(top: titleLabelView.bottomAnchor, left: margins.leftAnchor, bottom: nil, right: margins.rightAnchor, size: CGSize(width: 0, height: 60))
//        inputTitleView.translatesAutoresizingMaskIntoConstraints = false
//        inputTitleView.topAnchor.constraint(equalTo: titleLabelView.bottomAnchor).isActive = true
//        inputTitleView.leftAnchor.constraint(equalTo: margins.leftAnchor).isActive = true
//        inputTitleView.rightAnchor.constraint(equalTo: margins.rightAnchor).isActive = true
//        inputTitleView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    private func setupCategoryLabelView() {
        addSubview(categoryLabelView)
        categoryLabelView.anchor(top: inputTitleView.bottomAnchor, left: margins.leftAnchor, bottom: nil, right: margins.rightAnchor, size: CGSize(width: 0, height: 50))
//        categoryLabelView.translatesAutoresizingMaskIntoConstraints = false
//        categoryLabelView.topAnchor.constraint(equalTo: inputTitleView.bottomAnchor).isActive = true
//        categoryLabelView.leftAnchor.constraint(equalTo: margins.leftAnchor).isActive = true
//        categoryLabelView.rightAnchor.constraint(equalTo: margins.rightAnchor).isActive = true
//        categoryLabelView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func setupInputCategoryView() {
        addSubview(inputCategoryView)
        inputCategoryView.anchor(top: categoryLabelView.bottomAnchor, left: margins.leftAnchor, bottom: nil, right: margins.rightAnchor, size: CGSize(width: 0, height: 60))
//        inputCategoryView.translatesAutoresizingMaskIntoConstraints = false
//        inputCategoryView.topAnchor.constraint(equalTo: categoryLabelView.bottomAnchor).isActive = true
//        inputCategoryView.leftAnchor.constraint(equalTo: margins.leftAnchor).isActive = true
//        inputCategoryView.rightAnchor.constraint(equalTo: margins.rightAnchor).isActive = true
//        inputCategoryView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    private func setupDateLabelView() {
        addSubview(dateLabelView)
        dateLabelView.anchor(top: inputCategoryView.bottomAnchor, left: margins.leftAnchor, bottom: nil, right: margins.rightAnchor, size: CGSize(width: 0, height: 50))
//        dateLabelView.translatesAutoresizingMaskIntoConstraints = false
//        dateLabelView.topAnchor.constraint(equalTo: inputCategoryView.bottomAnchor).isActive = true
//        dateLabelView.leftAnchor.constraint(equalTo: margins.leftAnchor).isActive = true
//        dateLabelView.rightAnchor.constraint(equalTo: margins.rightAnchor).isActive = true
//        dateLabelView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func setupInputDateView() {
        addSubview(inputDateView)
        dateLabelView.anchor(top: dateLabelView.bottomAnchor, left: margins.leftAnchor, bottom: nil, right: margins.rightAnchor, size: CGSize(width: 0, height: 60))
//        inputDateView.translatesAutoresizingMaskIntoConstraints = false
//        inputDateView.topAnchor.constraint(equalTo: dateLabelView.bottomAnchor).isActive = true
//        inputDateView.leftAnchor.constraint(equalTo: margins.leftAnchor).isActive = true
//        inputDateView.rightAnchor.constraint(equalTo: margins.rightAnchor).isActive = true
//        inputDateView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    // MARK: - Remove all input
    func removeAllInput() {
        inputTitleView.inputTitle.text = ""
        inputCategoryView.categoryTextField.text = ""
        inputDateView.dateTextField.text = ""
    }
    
}
