//
//  TodoCategoryModel.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 10/03/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import Foundation
import UIKit

struct TodoCategory {
    var name: String
    var icon: String
    var totalTask: Int
    var finishTask: Int
    var items: [TodoItem]
    
    init(name: String, icon: String, totalTask: Int = 0, finishTask: Int = 0, items: [TodoItem] = [TodoItem]()) {
        self.name = name
        self.icon = icon
        self.totalTask = totalTask
        self.finishTask = finishTask
        self.items = items
    }
    
}
