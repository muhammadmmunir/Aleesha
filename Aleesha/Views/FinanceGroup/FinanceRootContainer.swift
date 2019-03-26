//
//  FinanceRootContainer.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 14/03/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import UIKit

class FinanceRootContainer: BaseView {

//    private var margins: UILayoutGuide {
//        return safeAreaLayoutGuide
//    }
    
    private let financeHeader: HeaderBar = {
        let header = HeaderBar()
        header.titleText = "Hai Aleesha,\nthis is your finance history."
        return header
    }()
    
    override func setupViews() {
        backgroundColor = .white
        setupFinanceHeader()
    }
    
    private func setupFinanceHeader() {
        addSubview(financeHeader)
        financeHeader.translatesAutoresizingMaskIntoConstraints = false
        financeHeader.topAnchor.constraint(equalTo: topAnchor).isActive = true
        financeHeader.leftAnchor.constraint(equalTo: margins.leftAnchor).isActive = true
        financeHeader.rightAnchor.constraint(equalTo: margins.rightAnchor).isActive = true
        financeHeader.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2).isActive = true
    }

}
