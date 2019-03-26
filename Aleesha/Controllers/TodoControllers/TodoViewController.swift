//
//  TodoViewController.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 09/03/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import UIKit

protocol TodoViewDelegate: class {
    func didCategoryTapped(with data: TodoCategory)
    func didAddTodoItemTapped()
}

class TodoViewController: UIViewController {

    private lazy var todoRootContainer: TodoRootContainer = {
        let root = TodoRootContainer()
        root.todoCategoryCollectionView.delegate = self
        return root
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
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
    
}

extension TodoViewController: TodoViewDelegate {
    
    func didCategoryTapped(with data: TodoCategory) {
        guard let navigationController = navigationController else {
            fatalError("Error, there is no navigation controller.")
        }
        let todoListController = TodoListViewController()
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
