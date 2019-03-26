//
//  HomeVC.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 09/03/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    private lazy var homeRootContainer: HomeRootContainer = {
        let root = HomeRootContainer()
        return root
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        becomeFirstResponder()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupNavigationBar(toHidden: true)
    }
    
    func setupNavigationBar(toHidden: Bool) {
        guard let navigationController = navigationController else {
            fatalError("Error, there is no navigation controller.")
        }
        navigationController.navigationBar.isHidden = toHidden
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        let counter = Int.random(in: 1...10)
        if motion == .motionShake {
            homeRootContainer.quoteText = "\"This is a amazing quote number \(counter)\""
        }
    }
    
    private func setupViews() {
        setupHomeRootContainer()
    }
    
    private func setupHomeRootContainer() {
        view = homeRootContainer
    }
}
