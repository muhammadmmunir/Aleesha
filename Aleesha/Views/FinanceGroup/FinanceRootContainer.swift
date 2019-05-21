//
//  FinanceRootContainer.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 14/03/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import UIKit

class FinanceRootContainer: BaseView {
    
    // MARK: - ContentView
    private let financeHeader: HeaderBar = {
        let header = HeaderBar()
        header.titleText = "Hai Aleesha,\nthis is your finance history."
        return header
    }()
    
    // MARK: - View customization
    override func setupViews() {
        backgroundColor = .white
        
        let contentView = [financeHeader]
        contentView.forEach(addSubview)
        
        financeHeader.anchorWithSizeMultiplier(top: topAnchor, left: margins.leftAnchor, bottom: nil, right: margins.rightAnchor, width: nil, height: heightAnchor, multiplier: CGSize(width: 0, height: 0.2))
    }

}
