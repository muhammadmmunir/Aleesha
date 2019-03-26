//
//  TodoCategoryContainer.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 15/03/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import UIKit

class TodoCategoryCollectionView: BaseView {
    
    var todoCategories = [TodoCategory]()
    
    weak var delegate: TodoViewDelegate?
    
    private var sreenHeight: CGFloat {
        return UIScreen.main.bounds.size.height
    }
    
    private lazy var categoryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()

    override func setupViews() {
        populateCategory()
        registerCustomViews()
        setupCategoryCollectionView()
    }
    
    private func populateCategory() {
        todoCategories.append(TodoCategory(name: "School", icon: ICON.categorySchool, totalTask: 7, finishTask: 4, items: [
            TodoItem(title: "Finish Paper Template", status: true, date: Date.yesterday),
            TodoItem(title: "Study Literature", date: Date.today),
            TodoItem(title: "Do the exercises of math", date: Date.today),
            TodoItem(title: "Check the homework", date: Date.tommorow),
            TodoItem(title: "Study Science", date: Date.tommorow),
            TodoItem(title: "Do the exercises of math", date: Date.tommorow)
            ]))
        todoCategories.append(TodoCategory(name: "Work", icon: ICON.categoryWork, totalTask: 4, finishTask: 3))
        todoCategories.append(TodoCategory(name: "Sport", icon: ICON.categorySport, totalTask: 2, finishTask: 1))
        todoCategories.append(TodoCategory(name: "Home", icon: ICON.categoryHome, totalTask: 11, finishTask: 8))
        todoCategories.append(TodoCategory(name: "Buy", icon: ICON.categoryBuy, totalTask: 4, finishTask: 1))
        todoCategories.append(TodoCategory(name: "Other", icon: ICON.categoryOther, totalTask: 0, finishTask: 0))
    }
    
    private func registerCustomViews() {
        categoryCollectionView.register(TodoCategoryCell.self, forCellWithReuseIdentifier: TodoCategoryCell.reuseIdentifier)
    }
    
    private func setupCategoryCollectionView() {
        addSubview(categoryCollectionView)
        categoryCollectionView.translatesAutoresizingMaskIntoConstraints = false
        categoryCollectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        categoryCollectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        categoryCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        categoryCollectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }

}

extension TodoCategoryCollectionView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return todoCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodoCategoryCell.reuseIdentifier, for: indexPath) as! TodoCategoryCell
        cell.todoCategory = todoCategories[indexPath.row]
        cell.setupProgressLine()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewCellWidth = (screenWidth / 2) - (screenWidth * 0.1)
        let collectionViewCellHeight = collectionViewCellWidth + 10
        return CGSize(width: collectionViewCellWidth, height: collectionViewCellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let padding = screenWidth * 0.075
        return UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didCategoryTapped(with: todoCategories[indexPath.row])
    }
    
}
