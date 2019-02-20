//
//  TodoItemViewCell.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 21/02/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import UIKit

class TodoItemViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var doneIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func changeLabelColor() {
        print("masuk nih")
        print(titleLabel.textColor == UIColor.black)
        if titleLabel.textColor == UIColor.black {
            
            titleLabel.textColor = UIColor.lightGray
            descriptionLabel.textColor = UIColor.lightGray
            print("masuk black")
            print(titleLabel.textColor)
        } else {
            titleLabel.textColor = UIColor.black
            descriptionLabel.textColor = UIColor.black
        }
        print("mau keluar")
        print(titleLabel.textColor)
        
    }
}
