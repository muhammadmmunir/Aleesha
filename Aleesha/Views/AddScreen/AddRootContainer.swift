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
    }
    
    // MARK: - Remove all input in add view
    func removeAllInput() {
        inputTitleView.inputTitle.text = ""
        inputCategoryView.categoryTextField.text = ""
        inputDateView.dateTextField.text = ""
    }
    
}
