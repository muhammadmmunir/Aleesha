//
//  TodoListRootContainer.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 16/03/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import UIKit

class TodoListRootContainer: BaseView {
    
    var todoCategory: TodoCategory? {
        didSet{
            if let todoCategory = todoCategory {
                todoListHeader.titleLabel.text = todoCategory.name
                todoListHeader.titleIcon.image = UIImage(named: todoCategory.icon)
                todoListHeader.taskNumberLabel.text = "\(todoCategory.totalTask) tasks"
                todoListTableView.todoItems = todoCategory.items
            }
        }
    }
    
    private let todoListHeader: TodoListHeader = {
        let header = TodoListHeader()
        header.titleLabel.text = "Other"
        header.titleIcon.image = UIImage(named: ICON.categoryHome)
        header.taskNumberLabel.text = "\(7) tasks"
        return header
    }()
    
    private let todoListTableView: TodoListTableView = {
        let tableView = TodoListTableView()
        return tableView
    }()

    override func setupViews() {
        backgroundColor = .white
        setupTodoListHeader()
        setupTodoListTableView()
    }
    
    private func setupTodoListHeader() {
        addSubview(todoListHeader)
        todoListHeader.translatesAutoresizingMaskIntoConstraints = false
        todoListHeader.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        todoListHeader.leftAnchor.constraint(equalTo: margins.leftAnchor).isActive = true
        todoListHeader.rightAnchor.constraint(equalTo: margins.rightAnchor).isActive = true
        todoListHeader.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15).isActive = true
    }
    
    private func setupTodoListTableView() {
        addSubview(todoListTableView)
        todoListTableView.translatesAutoresizingMaskIntoConstraints = false
        todoListTableView.topAnchor.constraint(equalTo: todoListHeader.bottomAnchor).isActive = true
        todoListTableView.leftAnchor.constraint(equalTo: margins.leftAnchor).isActive = true
        todoListTableView.rightAnchor.constraint(equalTo: margins.rightAnchor).isActive = true
        todoListTableView.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
    }

}
