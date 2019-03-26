//
//  FloatingButton.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 16/03/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import UIKit

class FloatingButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    weak var delegate: TodoViewDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        let icon = UIImage(named: ICON.addButton)
        self.setImage(icon, for: .normal)
        self.tintColor = .white
        self.backgroundColor = UIColor(rgb: 0x00E4B8)
        self.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        self.addTarget(self, action: #selector(addCategory), for: .touchUpInside)
        
        self.layer.cornerRadius = 30
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 10.0
        self.layer.shadowOpacity = 0.5
    }
    
    @objc private func addCategory(_ sender: UIButton){
        delegate?.didAddTodoItemTapped()
    }
    
}
