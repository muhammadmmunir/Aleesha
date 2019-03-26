//
//  AddViewController.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 23/03/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import UIKit

protocol AddViewControllerDelegate: class {
    func alertInput(with text: String)
    func didCloseButtonTapped()
}

class AddViewController: UIViewController {

    var todoCategories = [TodoCategory]()
    
    private lazy var addTodoItemRootContainer: AddRootContainer = {
        let root = AddRootContainer()
        root.inputDateView.alertDelegate = self
        root.inputTitleView.alertDelegate = self
        root.inputCategoryView.alertDelegate = self
        root.navBar.buttonDelegate = self
        return root
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        populateCategory()
        setupViews()
        closeKeyboardWhenTapAnywhere()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        addTodoItemRootContainer.removeAllInput()
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
        addTodoItemRootContainer.inputCategoryView.categories = todoCategories
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupNavigationBar(toHidden: true)
        setupTabBar(toHidden: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        setupNavigationBar(toHidden: false)
        setupTabBar(toHidden: false)
    }
    
    func setupNavigationBar(toHidden: Bool) {
        guard let navigationController = navigationController else {
            fatalError("Error, there is no navigation controller.")
        }
        navigationController.navigationBar.isHidden = toHidden
        
        setupNavBarToTransparantMode()
        setupNavBarBackButton()
        setupNavBarDoneButton()
    }
    
    func setupTabBar(toHidden: Bool) {
        guard let tabBarController = tabBarController else {
            fatalError("Error, there is no tab bar controller.")
        }
        tabBarController.tabBar.isHidden = toHidden
    }
    
    private func setupViews() {
        view = addTodoItemRootContainer
        
    }
    
    func setupNavBarBackButton() {
        // Add custom leftBarButtonItem
        let backIcon = UIImage(named: ICON.navBarBack)
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
    
    func setupNavBarDoneButton() {
        // Add custom rightBarButtonItem
        let profileIcon = UIImage(named: ICON.navBarDone)
        let rightButton = UIButton(type: .custom)
        rightButton.setImage(profileIcon, for: .normal)
        rightButton.addTarget(self, action: #selector(backToParentView), for: .touchUpInside)
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        rightButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        rightButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        rightButton.tintColor = .gray
        let profileButton = UIBarButtonItem(customView: rightButton)
        let rightSpacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        rightSpacer.width = 20
        navigationItem.rightBarButtonItems = [rightSpacer, profileButton]
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
    
    private func closeKeyboardWhenTapAnywhere() {
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //        tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
    }
    
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
}

extension AddViewController: AddViewControllerDelegate {
    
    func alertInput(with text: String) {
        let alert = UIAlertController(title: "Warning", message: text, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func didCloseButtonTapped() {
        let lastSelectedIndex = TabBarProperty.selectedIndex
        
        guard let tabBarController =  tabBarController, let viewControllers = tabBarController.viewControllers else {
            fatalError("Error, can not get view controllers")
        }
        
        if let sourceView = self.view, let destinationView = viewControllers[lastSelectedIndex].view {
            UIView.transition(from: sourceView, to: destinationView, duration: 0.4, options: [.transitionCrossDissolve]) { (true) in
                tabBarController.selectedIndex = TabBarProperty.selectedIndex
            }
        }
    }
    
}
