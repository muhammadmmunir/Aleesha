//
//  TodoItemModel.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 10/03/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import Foundation

struct TodoItem {
    var title: String
    var status: Bool
    var date: Date
    
    init(title: String, status: Bool = false, date: Date = Date()) {
        self.title = title
        self.status = status
        self.date = date
    }
}

