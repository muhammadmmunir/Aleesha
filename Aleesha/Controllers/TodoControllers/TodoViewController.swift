//
//  TodoViewController.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 09/03/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import CoreData
import UIKit

protocol TodoViewDelegate: class {
    func didCategoryTapped(with data: TodoCategory)
    func didAddTodoItemTapped()
}

class TodoViewController: UIViewController {
    
    // MARK: - Initialize core data manager
    var manegedObjectContext: NSManagedObjectContext!
    
    lazy var catageoryFetchResultsController: NSFetchedResultsController<NSFetchRequestResult> = {
        // Initialize fetch request
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "TodoCategory")
        
        // Add Sort descriptor
        let sortByName = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortByName]
        
        // Initialize fetch result controller
        let fetchResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.manegedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        
        return fetchResultsController
    }()

    private lazy var todoRootContainer: TodoRootContainer = {
        let root = TodoRootContainer()
        root.todoCategoryCollectionView.todoCategories = [TodoCategory]()
        root.todoCategoryCollectionView.delegate = self
        return root
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        performFetchTodoCategory()
        setupViews()
    }
    
    private func performFetchTodoCategory() {
        do {
            try self.catageoryFetchResultsController.performFetch()
            todoRootContainer.todoCategoryCollectionView.categoryFetchResultsController = self.catageoryFetchResultsController
            self.catageoryFetchResultsController.delegate = todoRootContainer.todoCategoryCollectionView as NSFetchedResultsControllerDelegate
        } catch {
            let fetchError = error as NSError
            print("\(fetchError), \(fetchError.userInfo)")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupNavigationBar(toHidden: true)
    }
    
    func setupNavigationBar(toHidden: Bool) {
        guard let navigationController = navigationController else {
            fatalError("Error, there is no navigation controller.")
        }
        navigationController.navigationBar.isHidden = toHidden
    }
    
    func setupViews() {
        view = todoRootContainer
    }
    
//    private func populateCategory() {
//        todoCategories.append(TodoCategory(name: "School", icon: ICON.categorySchool, totalTask: 7, finishTask: 4, items: [
//            TodoItem(title: "Finish Paper Template", status: true, date: Date.yesterday),
//            TodoItem(title: "Study Literature", date: Date.today),
//            TodoItem(title: "Do the exercises of math", date: Date.today),
//            TodoItem(title: "Check the homework", date: Date.tommorow),
//            TodoItem(title: "Study Science", date: Date.tommorow),
//            TodoItem(title: "Do the exercises of math", date: Date.tommorow)
//            ]))
//        todoCategories.append(TodoCategory(name: "Work", icon: ICON.categoryWork, totalTask: 4, finishTask: 3))
//        todoCategories.append(TodoCategory(name: "Sport", icon: ICON.categorySport, totalTask: 2, finishTask: 1))
//        todoCategories.append(TodoCategory(name: "Home", icon: ICON.categoryHome, totalTask: 11, finishTask: 8))
//        todoCategories.append(TodoCategory(name: "Buy", icon: ICON.categoryBuy, totalTask: 4, finishTask: 1))
//        todoCategories.append(TodoCategory(name: "Other", icon: ICON.categoryOther, totalTask: 0, finishTask: 0))
//    }
    
}

extension TodoViewController: TodoViewDelegate {
    
    func didCategoryTapped(with data: TodoCategory) {
        guard let navigationController = navigationController else {
            fatalError("Error, there is no navigation controller.")
        }
        let todoListController = TodoListViewController()
        todoListController.managedObjectContext = self.manegedObjectContext
        todoListController.todoCategory = data
        navigationController.pushViewController(todoListController, animated: true)
    }
    
    func didAddTodoItemTapped() {
        guard let navigationController = navigationController else {
            fatalError("Error, there is no navigation controller.")
        }
        let addTodoItemController = AddViewController()
        navigationController.pushViewController(addTodoItemController, animated: true)
    }
    
}
