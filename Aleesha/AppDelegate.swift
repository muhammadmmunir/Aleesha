//
//  AppDelegate.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 14/02/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import CoreData
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Instance variables
    var window: UIWindow?
    
    private let mainTabBarController: MainTabBarController = {
        let mainTabBarController = MainTabBarController()
        return mainTabBarController
    }()

    // MARK: - Initial setup
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        if let window = window {
//            let todo = UINavigationController(rootViewController: TodoViewController())
            window.rootViewController = mainTabBarController
            window.makeKeyAndVisible()
        }
        
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        CoreDataManager.sharedManager.saveContext()
    }

}
