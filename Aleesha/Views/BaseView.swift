//
//  BaseView.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 14/03/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import UIKit

// MARK: - Base View Protocol
protocol BaseViewInterface {
    func setupViews()
}

class BaseView: UIView, BaseViewInterface {
    
    // MARK: - Instance variables
    var margins: UILayoutGuide {
        return safeAreaLayoutGuide
    }
    var screenWidth: CGFloat {
        return UIScreen.main.bounds.size.width
    }
    var screenHeight: CGFloat {
        return UIScreen.main.bounds.size.height
    }

    // MARK: - View customization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {}

}
