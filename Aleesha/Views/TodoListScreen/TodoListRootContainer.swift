//
//  TodoListRootContainer.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 16/03/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import UIKit

class TodoListRootContainer: BaseView {
    
    // MARK: - Instance variables
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
    
    // MARK: - ContentView
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

    // MARK: - View customization
    override func setupViews() {
        backgroundColor = .white
        
        let contentView = [todoListHeader, todoListTableView]
        contentView.forEach(addSubview)
        
        todoListHeader.anchorWithSizeMultiplier(top: margins.topAnchor, left: margins.leftAnchor, bottom: nil, right: margins.rightAnchor, width: nil, height: heightAnchor, multiplier: CGSize(width: 0, height: 0.15))
        todoListTableView.anchor(top: todoListHeader.bottomAnchor, left: margins.leftAnchor, bottom: margins.bottomAnchor, right: margins.rightAnchor)
    }
    
}
