//
//  TodoRootContainer.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 14/03/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import UIKit

class TodoRootContainer: BaseView {
    
    // MARK: - ContentView
    private let todoHeader: HeaderBar = {
        let header = HeaderBar()
        header.titleText = "Hai Aleesha,\nthis is your todo list category."
        return header
    }()

    lazy var todoCategoryCollectionView: TodoCategoryCollectionView = {
        let todo = TodoCategoryCollectionView()
        return todo
    }()
    
    // MARK: - View customization
    override func setupViews() {
        backgroundColor = .white
        
        let contentView = [todoHeader, todoCategoryCollectionView]
        contentView.forEach(addSubview)
        
        todoHeader.anchorWithSizeMultiplier(top: topAnchor, left: margins.leftAnchor, bottom: nil, right: margins.rightAnchor, width: nil, height: heightAnchor, multiplier: CGSize(width: 0, height: 0.2))
        todoCategoryCollectionView.anchor(top: todoHeader.bottomAnchor, left: margins.leftAnchor, bottom: margins.bottomAnchor, right: margins.rightAnchor)
    }

}
