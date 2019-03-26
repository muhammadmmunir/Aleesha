//
//  BaseView.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 14/03/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import UIKit

protocol BaseViewInterface {
    func setupViews()
}

class BaseView: UIView, BaseViewInterface {
    
    var margins: UILayoutGuide {
        return safeAreaLayoutGuide
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {}

}
