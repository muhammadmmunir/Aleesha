//
//  HomeTopContainer.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 12/03/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import UIKit

class HomeTopContainer: BaseView {
    
    private var day: String {
        return getTodayDateWithFormat("dd")
    }
    
    private var month: String {
        return getTodayDateWithFormat("MMM")
    }
    
    private var year: String {
        return getTodayDateWithFormat("yyyy")
    }
    
//    private var margins: UILayoutGuide {
//        return safeAreaLayoutGuide
//    }
    
    var quoteText: String? {
        didSet{
            if let quoteText = quoteText {
                quoteLabel.text = quoteText
            }
        }
    }
    
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

    private func getTodayDateWithFormat(_ format: String) -> String {
        
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let dateType = dateFormatter.string(from: now)
        
        return dateType
    }
    
    override func setupViews() {
        backgroundColor = UIColor(rgb: 0x00D1C4)
        layer.cornerRadius = 30
        layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        setupDateLabel()
//        setupQuoteView()
        setupQuoteLabel()
    }
    
    private func setupDateLabel() {
        addSubview(dayLabel)
        dayLabel.text = self.day
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        dayLabel.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        dayLabel.topAnchor.constraint(equalTo: margins.topAnchor, constant: 50).isActive = true
        
        addSubview(monthYearLabel)
        monthYearLabel.text = "\(self.month) \(self.year)"
        monthYearLabel.translatesAutoresizingMaskIntoConstraints = false
        monthYearLabel.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        monthYearLabel.topAnchor.constraint(equalTo: dayLabel.bottomAnchor, constant: 0).isActive = true
    }
    
//    private func setupQuoteView() {
//        addSubview(quoteView)
//        quoteView.translatesAutoresizingMaskIntoConstraints = false
//        quoteView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
//        quoteView.heightAnchor.constraint(equalToConstant: 60).isActive = true
//        quoteView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
//    }
    
    private func setupQuoteLabel() {
        addSubview(quoteLabel)
        quoteLabel.translatesAutoresizingMaskIntoConstraints = false
//        quoteLabel.topAnchor.constraint(equalTo: bottomAnchor, constant: 50).isActive = true
        quoteLabel.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -10).isActive = true
        quoteLabel.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        quoteLabel.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 0.8).isActive = true
        
    }
}
