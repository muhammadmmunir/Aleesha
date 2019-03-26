//
//  TodoListTableViewHeader.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 22/03/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import UIKit

class TodoListTableViewHeader: UITableViewHeaderFooterView {

    static let reuseIdentifier = "TodoListTableViewHeader"
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.init(name: "AvenirNext-Medium", size: 18)
        label.textColor = .gray
        label.textAlignment = .left
        return label
    }()
    
    override public init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .white
        
        setupHeaderLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupHeaderLabel() {
        let margins = layoutMarginsGuide
        addSubview(headerLabel)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        headerLabel.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: 15).isActive = true
        headerLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
    }
}
