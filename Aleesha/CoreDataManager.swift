//
//  CoreDataManager.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 09/04/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import CoreData
import Foundation
import UIKit

class CoreDataManager {
    
    static let sharedManager = CoreDataManager()
    private init() {} // Prevents client for creating instances
    
    // MARK: - Core Data Stack
    lazy var applicationDocumentDirectory: URL = {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return urls[urls.count - 1]
    }()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DataModel")
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        
        return container
    }()
    
    // MARK: - Core Data Saving support
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}
