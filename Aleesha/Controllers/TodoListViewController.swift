//
//  TodoListViewController.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 20/02/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    let toDoItems: [String] = [
        "Create home screen for Aleesha app.",
        "Create table view controller for to do list.",
        "Create detail for todo item.",
    ]
    
    let toDoFinised: [Bool] = [
        true,
        false,
        false
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItem", for: indexPath)
        cell.textLabel?.text = toDoItems[indexPath.row]
        cell.imageView?.image = UIImage(named: "unchecked")
        return cell
    }

}
