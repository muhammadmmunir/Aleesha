//
//  TodoListViewController.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 16/03/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import CoreData
import UIKit

class TodoListViewController: UIViewController {
    
    var todoCategory: TodoCategory?
    var managedObjectContext: NSManagedObjectContext!
    
    lazy var todoListFetchResultsController: NSFetchedResultsController<NSFetchRequestResult> = {
        // Initialize fetch request
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "TodoItem")
        
        // Add predicate
        guard let name = self.todoCategory?.name else {
            return NSFetchedResultsController()
        }

        let sortName = NSSortDescriptor(key: "title", ascending: true)
        let itemName = NSPredicate(format: "%K == %@", "category.name", name)
        fetchRequest.sortDescriptors = [sortName]
        fetchRequest.predicate = itemName
        
        let fetchResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        
        return fetchResultsController
    }()
    
    private lazy var todoListRootContainer: TodoListRootContainer = {
        let root = TodoListRootContainer()
        root.todoCategory = self.todoCategory
        return root
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        performFetchTodoList()
        setupViews()
    }
    
    private func performFetchTodoList() {
        do {
            try self.todoListFetchResultsController.performFetch()
            let record = todoListFetchResultsController.fetchedObjects as! [TodoItem]
            todoListRootContainer.todoItems = record
            
        } catch {
            let fetchError = error as NSError
            print("\(fetchError), \(fetchError.userInfo)")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupNavigationBar(toHidden: false)
        setupTabBar(toHidden: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        setupNavigationBar(toHidden: true)
        setupTabBar(toHidden: false)
    }
    
    func setupNavigationBar(toHidden: Bool) {
        guard let navigationController = navigationController else {
            fatalError("Error, there is no navigation controller.")
        }
        navigationController.navigationBar.isHidden = toHidden
        
        setupNavBarToTransparantMode()
        setupNavBarBackButton()
    }
    
    func setupTabBar(toHidden: Bool) {
        guard let tabBarController = tabBarController else {
            fatalError("Error, there is no tab bar controller.")
        }
        tabBarController.tabBar.isHidden = toHidden
    }
    
    func setupViews() {
        view = todoListRootContainer
    }
    
    func setupNavBarBackButton() {
        // Add custom leftBarButtonItem
        let backIcon = UIImage(named: ICON.navBarBack)
        backIcon?.withRenderingMode(.alwaysTemplate)
        let leftButton = UIButton(type: .custom)
        leftButton.setImage(backIcon, for: .normal)
        leftButton.addTarget(self, action: #selector(backToParentView), for: .touchUpInside)
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        leftButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        leftButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        leftButton.tintColor = .lightGray
        let backButton = UIBarButtonItem(customView: leftButton)
        let leftSpacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        leftSpacer.width = 20
        navigationItem.leftBarButtonItems = [leftSpacer, backButton]
    }
    
    func setupNavBarToTransparantMode(){
        guard let navigationController = navigationController else {
            fatalError("Error, there is no navigation controller.")
        }
        
        // set navbar to white and disable transparant mode
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController.navigationBar.shadowImage = UIImage()

    }
    
    // Handle action for leftBarButtonItem
    @objc func backToParentView() {
        navigationController?.popViewController(animated: true)
    }
    
}
