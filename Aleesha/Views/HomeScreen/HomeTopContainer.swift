//
//  HomeTopContainer.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 12/03/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import UIKit

class HomeTopContainer: BaseView {
    
    // MARK: - Instance variables
    private var day: String {
        return getTodayDateWithFormat("dd")
    }
    private var month: String {
        return getTodayDateWithFormat("MMM")
    }
    private var year: String {
        return getTodayDateWithFormat("yyyy")
    }
    var quoteText: String? {
        didSet{
            if let quoteText = quoteText {
                quoteLabel.text = quoteText
            }
        }
    }
    
    // MARK: - ContentView
    private let dayLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 100)
        label.text = "01"
        label.textColor = .white
        return label
    }()
    
    private let monthYearLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-Medium", size: 30)
        label.text = "Jan"
        label.textColor = .white
        return label
    }()
    
    private let quoteView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(rgb: 0x36D5FF)
        view.layer.cornerRadius = 30
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(rgb: 0x00D1C4).cgColor
        return view
    }()
    
    private let quoteLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-DemiBoldItalic", size: 18)
        label.text = "\"Only I can change my life. No one can do it for me.\""
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    // MARK: - View customization
    override func setupViews() {
        backgroundColor = UIColor(rgb: 0x00D1C4)
        layer.cornerRadius = 30
        layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        let contentView = [dayLabel, monthYearLabel, quoteLabel]
        contentView.forEach(addSubview)
        
        dayLabel.text = self.day
        monthYearLabel.text = "\(self.month) \(self.year)"
        dayLabel.anchorWithCenter(top: margins.topAnchor, left: nil, bottom: nil, right: nil, padding: UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0), vertical: nil, horizontal: centerXAnchor)
        monthYearLabel.anchorWithCenter(top: dayLabel.bottomAnchor, left: nil, bottom: nil, right: nil, vertical: nil, horizontal: margins.centerXAnchor)
        quoteLabel.anchorWithCenterAndSizeMultiplier(top: nil, left: nil, bottom: margins.bottomAnchor, right: nil, padding: UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0) ,vertical: nil, horizontal: margins.centerXAnchor, width: margins.widthAnchor, height: nil, multiplier: CGSize(width: 0.8, height: 0))
    }
    
    private func getTodayDateWithFormat(_ format: String) -> String {
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let dateType = dateFormatter.string(from: now)
        return dateType
    }
    
}
