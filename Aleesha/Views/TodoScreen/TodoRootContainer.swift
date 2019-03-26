//
//  TodoRootContainer.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 14/03/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import UIKit

class TodoRootContainer: BaseView {
    
    private var panGesture: UIPanGestureRecognizer = {
        let gesture = UIPanGestureRecognizer()
        return gesture
    }()
    
    private let todoHeader: HeaderBar = {
        let header = HeaderBar()
        header.titleText = "Hai Aleesha,\nthis is your todo list category."
        return header
    }()

    lazy var todoCategoryCollectionView: TodoCategoryCollectionView = {
        let todo = TodoCategoryCollectionView()
        return todo
    }()
    
//    lazy var addButton: FloatingButton = {
//        let button = FloatingButton()
//        return button
//    }()
    
    override func setupViews() {
        backgroundColor = .white
//        setupPanGestureOnAddButton()
        setupTodoHeader()
        setupTodoCategoryCollectionView()
//        setupAddButton()
    }
    
//    private func setupPanGestureOnAddButton() {
//        panGesture.addTarget(self, action: #selector(draggedAddButton))
//        addButton.isUserInteractionEnabled = true
//        addButton.addGestureRecognizer(panGesture)
//    }
    
//    @objc private func draggedAddButton(_ sender: UIPanGestureRecognizer) {
//        if sender.state == .began || sender.state == .changed {
//            bringSubviewToFront(addButton)
//            let point = sender.location(in: self)
////            let restrictByPoint: CGFloat = 30
//            let draggableArea = CGRect(x: 40, y: 200, width: 300, height: 480)
//            if draggableArea.contains(point) {
//                let translation = sender.translation(in: self)
//                addButton.center = CGPoint(x: addButton.center.x + translation.x, y: addButton.center.y + translation.y)
//                sender.setTranslation(CGPoint.zero, in: self)
//            }
//        }
//    }

    private func setupTodoHeader() {
        addSubview(todoHeader)
        todoHeader.translatesAutoresizingMaskIntoConstraints = false
        todoHeader.topAnchor.constraint(equalTo: topAnchor).isActive = true
        todoHeader.leftAnchor.constraint(equalTo: margins.leftAnchor).isActive = true
        todoHeader.rightAnchor.constraint(equalTo: margins.rightAnchor).isActive = true
        todoHeader.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2).isActive = true
    }
    
    private func setupTodoCategoryCollectionView() {
        addSubview(todoCategoryCollectionView)
        todoCategoryCollectionView.translatesAutoresizingMaskIntoConstraints = false
        todoCategoryCollectionView.topAnchor.constraint(equalTo: todoHeader.bottomAnchor).isActive = true
        todoCategoryCollectionView.leftAnchor.constraint(equalTo: margins.leftAnchor).isActive = true
        todoCategoryCollectionView.rightAnchor.constraint(equalTo: margins.rightAnchor).isActive = true
        todoCategoryCollectionView.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
    }
    
//    private func setupAddButton() {
//        let padding = (screenWidth / 2) * 0.1
//        
//        addSubview(addButton)
//        addButton.translatesAutoresizingMaskIntoConstraints = false
//        
//        addButton.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
//        addButton.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -padding).isActive = true
//        addButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
//        addButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
//    }
    
}
