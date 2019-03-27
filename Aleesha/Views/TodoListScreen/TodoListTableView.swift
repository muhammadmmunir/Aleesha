//
//  TodoListTableView.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 22/03/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import UIKit

class TodoListTableView: BaseView {
    
    // MARK: - Instance variables
    private var sections = [TodoSectionItem]()
    var todoItems: [TodoItem]? {
        didSet{
            if let todoItems = todoItems {
                var todoItemsOverdue = [TodoItem]()
                var todoItemsToday = [TodoItem]()
                var todoItemsTommorow = [TodoItem]()
                
                todoItems.forEach { (item) in
                    let order = Calendar.current.compare(item.date, to: Date.today, toGranularity: .day)
                    if order == .orderedSame {
                        todoItemsToday.append(item)
                    }
                    else if order == .orderedDescending {
                        todoItemsTommorow.append(item)
                    }
                    else if order == .orderedAscending {
                        todoItemsOverdue.append(item)
                    }
                }
                
                if !todoItemsToday.isEmpty {
                    sections.append(TodoSectionItem(name: "Today", items: todoItemsToday))
                }
                if !todoItemsTommorow.isEmpty {
                    sections.append(TodoSectionItem(name: "Tommorrow", items: todoItemsTommorow))
                }
                if !todoItemsOverdue.isEmpty {
                    sections.append(TodoSectionItem(name: "Overdue", items: todoItemsOverdue))
                }
                
                if todoItemsToday.isEmpty && todoItemsTommorow.isEmpty && todoItemsOverdue.isEmpty {
                    sections.append(TodoSectionItem(name: "Not Added Yet...", items: [TodoItem]()))
                }
            }
        }
    }
    
    // MARK: - ContentView
    private lazy var todoListTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    // MARK: - View customization
    override func setupViews() {
        registerCustomViews()
        
        let contentView = [todoListTableView]
        contentView.forEach(addSubview)
        
        todoListTableView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        
        // customization on table view
        todoListTableView.separatorStyle = .singleLine
        // hide separatorStyle on blank tableView
        todoListTableView.tableFooterView = UIView.init()
    }
    
    private func registerCustomViews() {
        todoListTableView.register(TodoListTableViewHeader.self, forHeaderFooterViewReuseIdentifier: TodoListTableViewHeader.reuseIdentifier)
        todoListTableView.register(TodoListTableViewCell.self, forCellReuseIdentifier: TodoListTableViewCell.reuseIdentifier)
    }

}

// MARK: - Table view data source and delegate

extension TodoListTableView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: TodoListTableViewHeader.reuseIdentifier) as! TodoListTableViewHeader
        header.headerLabel.text = sections[section].name
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TodoListTableViewCell.reuseIdentifier, for:
            indexPath) as! TodoListTableViewCell
        let title = sections[indexPath.section].items[indexPath.row].title
        let status = sections[indexPath.section].items[indexPath.row].status
        cell.changeTodoItem(from: status, and: title)
        cell.isUserInteractionEnabled = true
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let status = sections[indexPath.section].items[indexPath.row].status
        sections[indexPath.section].items[indexPath.row].status = !status
        tableView.reloadData()
    }
}
