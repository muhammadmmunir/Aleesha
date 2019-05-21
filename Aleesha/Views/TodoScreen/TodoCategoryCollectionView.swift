//
//  TodoCategoryContainer.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 15/03/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import CoreData
import UIKit

class TodoCategoryCollectionView: BaseView {
    
    // MARK: - Instance variables
    var todoCategories = [TodoCategory]()
    weak var delegate: TodoViewDelegate?
    weak var categoryFetchResultsController: NSFetchedResultsController<NSFetchRequestResult>?
    
    // MARK: - ContentView
    private lazy var categoryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()

    // MARK: - View customization
    override func setupViews() {
        registerCustomViews()
        
        let contentView = [categoryCollectionView]
        contentView.forEach(addSubview)
        
        categoryCollectionView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
    }
    
    private func registerCustomViews() {
        categoryCollectionView.register(TodoCategoryCell.self, forCellWithReuseIdentifier: TodoCategoryCell.reuseIdentifier)
    }

}

// MARK: - CollectionView data source and delegate
extension TodoCategoryCollectionView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        if let sections = categoryFetchResultsController?.sections {
            return sections.count
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return todoCategories.count
        if let sections = categoryFetchResultsController?.sections {
            let sectionInfo = sections[section]
            return sectionInfo.numberOfObjects
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodoCategoryCell.reuseIdentifier, for: indexPath) as! TodoCategoryCell
        
        configureCell(cell, atIndexPath: indexPath)
//        cell.todoCategory = todoCategories[indexPath.row]
//        cell.setupProgressLine()
        return cell
    }
    
    // Helper method for cellForItemAt
    private func configureCell(_ cell: TodoCategoryCell, atIndexPath indexPath: IndexPath) {
        
        guard let categoryFetchResultsController = categoryFetchResultsController else {
            return
        }
        
        // Fetch record
        let category = categoryFetchResultsController.object(at: indexPath) as! TodoCategory
        cell.todoCategory = category
        cell.setupProgressLine()
        
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
        
        guard let categoryFetchResultsController = categoryFetchResultsController else {
            return
        }
        
        // Fetch record
        let category = categoryFetchResultsController.object(at: indexPath) as! TodoCategory
        
        delegate?.didCategoryTapped(with: category)
    }
    
}

extension TodoCategoryCollectionView: NSFetchedResultsControllerDelegate {
    
//    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
//        self.categoryCollectionView.beginUpdate
//    }
    
}
