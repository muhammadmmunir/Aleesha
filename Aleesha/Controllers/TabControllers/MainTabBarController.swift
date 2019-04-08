//
//  MainTabBarController.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 13/03/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import UIKit

struct TabBarProperty {
    static var selectedIndex = 0
}

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        
        setupViews()
        setupTabBar()
    }
    
    private func setupViews() {
        // remove background image and shadow image
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
        
        // add custom background
        tabBar.backgroundColor = UIColor(rgb: 0x00D1C4)
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .gray
    }
    
    private func setupTabBar() {
        let homeNavigationController = setupNavigationController(with: HomeViewController(), with: "", and: ICON.tabHome)
        let todoNavigationController = setupNavigationController(with: TodoViewController(), with: "", and: ICON.tabTodo)
        let addNavigationController = setupNavigationController(with: AddViewController(), with: "", and: ICON.tabAdd)
        let financeNavigationController = setupNavigationController(with: FinanceViewController(), with: "", and: ICON.tabFinance)
        let profileNavigationController = setupNavigationController(with: ProfileViewController(), with: "", and: ICON.tabProfile)
        
        // Setting instance variable
        let todoViewController = todoNavigationController.topViewController as? TodoViewController
        
        if let todoViewController = todoViewController {
            todoViewController.manegedObjectContext = CoreDataManager.sharedManager.persistentContainer.viewContext
        }
        
        viewControllers = [
            homeNavigationController,
            todoNavigationController,
            addNavigationController,
            financeNavigationController,
            profileNavigationController
        ]
    }
    
    private func setupNavigationController(with viewController: UIViewController, with title: String, and imageName: String) -> UINavigationController {
        
        let customViewController = viewController
        let navigationController = UINavigationController(rootViewController: customViewController)
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = UIImage(named: imageName)
        return navigationController
        
    }
    
    private var bounceAnimation: CAKeyframeAnimation = {
        let bounceAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        bounceAnimation.values = [1.0, 1.4, 0.9, 1.02, 1.0]
        bounceAnimation.duration = TimeInterval(0.3)
        bounceAnimation.calculationMode = CAAnimationCalculationMode.cubic
        return bounceAnimation
    }()

}

extension MainTabBarController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        guard let sourceView = selectedViewController?.view, let destinationView = viewController.view else {
            fatalError("Failed to unwrap view controller.")
        }
        
        if sourceView != destinationView {
            UIView.transition(from: sourceView, to: destinationView, duration: 0.4, options: [.transitionCrossDissolve], completion: nil)
        }
        
        // Set static property
        TabBarProperty.selectedIndex = tabBarController.selectedIndex
        
        return true
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard
            let index = tabBar.items?.index(of: item),
            tabBar.subviews.count > index + 1,
            let tabIconImageView = tabBar.subviews[index + 1].subviews.first as? UIImageView else {
                
                fatalError("Error while trying to get imageView on tab bar.")
        }
        
        tabIconImageView.layer.add(bounceAnimation, forKey: nil)
    }
}
