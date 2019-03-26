//
//  FinanceViewController.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 09/03/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import UIKit

class FinanceViewController: UIViewController {

    private lazy var financeRootContainer: FinanceRootContainer = {
        let root = FinanceRootContainer()
        return root
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        setupNavigationBar(toHidden: true)
    }
    
    func setupNavigationBar(toHidden: Bool) {
        guard let navigationController = navigationController else {
            fatalError("Error, there is no navigation controller.")
        }
        navigationController.navigationBar.isHidden = toHidden
    }
    
    func setupViews() {
        view = financeRootContainer
    }

}
