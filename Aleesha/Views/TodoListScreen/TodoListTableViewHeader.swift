//
//  TodoListTableViewHeader.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 22/03/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import UIKit

class TodoListTableViewHeader: UITableViewHeaderFooterView {

    // MARK: - Instance variables
    static let reuseIdentifier = "TodoListTableViewHeader"
    private var margins: UILayoutGuide {
        return safeAreaLayoutGuide
    }
    
    // MARK: - ContentView
    let headerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.init(name: "AvenirNext-Medium", size: 18)
        label.textColor = .gray
        label.textAlignment = .left
        return label
    }()
    
    // MARK: - View customization
    override public init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .white
        
        let subView = [headerLabel]
        subView.forEach(addSubview)
        
        headerLabel.anchorWithCenter(top: margins.topAnchor, left: margins.leftAnchor, bottom: nil, right: nil, padding: UIEdgeInsets(top: 0, left: 35, bottom: 0, right: 0), vertical: centerYAnchor, horizontal: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
