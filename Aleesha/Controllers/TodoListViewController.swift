//
//  TodoListViewController.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 20/02/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import UIKit

enum Status: String {
    case toDo = "TO DO"
    case inProgress = "IN PROGRESS"
    case pending = "PENDING"
    case done = "DONE"
    
    func toString() -> String {
        return self.rawValue
    }
}

struct TodoItem {
    var title: String
    var description: String
    var important: Bool = false
    var status: Status?
    var startDate: Date?
    var endDate: Date?
    
    init(title: String, description: String, important: Bool = false, status: Status = .toDo, startDate: Date = Date(), endDate: Date = Date()) {
        self.title = title
        self.description = description
        self.important = important
        self.status = status
        self.startDate = startDate
        self.endDate = endDate
    }
}

class TodoListViewController: UITableViewController {
    
    var toDoItems = [TodoItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
        toDoItems = [
            TodoItem(title: "Create home screen for Aleesha app.", description: "Create ui and ux for home screen, create component and functionality.", status: .inProgress),
            TodoItem(title: "Create table view controller for to do list.", description: "Create data for table view controller, design ui and ux, and specify functionality in table view controller."),
            TodoItem(title: "Create detail for todo item.", description: "Specify data for todo item detail, design ui and ux, and specify functionality in detail todo item.", status: .done),
        ]
        tableView.separatorStyle = .none
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItem", for: indexPath) as! TodoItemViewCell
        cell.titleLabel.text = toDoItems[indexPath.row].title
        let iconImage = toDoItems[indexPath.row].status == Status.done ? UIImage(named: "check") : UIImage(named: "uncheck")
        cell.doneIcon.image = iconImage
        cell.descriptionLabel.text = toDoItems[indexPath.row].description
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard (toDoItems[indexPath.row].status != nil) else {
            fatalError("Error: status is not provided.")
        }

        toDoItems[indexPath.row].status = toDoItems[indexPath.row].status == .done ? .toDo : .done
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItem", for: indexPath) as! TodoItemViewCell
        cell.changeLabelColor()
        
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
