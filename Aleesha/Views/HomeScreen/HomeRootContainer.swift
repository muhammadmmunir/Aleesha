//
//  HomeRootContainer.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 12/03/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import UIKit

class HomeRootContainer: BaseView {
    
    // MARK: - Instance variables
    var quoteText: String? {
        didSet{
            if let quoteText = quoteText {
                topContainer.quoteText = quoteText
            }
        }
    }
    var todos = [HomeSectionItem]()
    var finance = [HomeSectionItem]()
    
    // MARK: - ContentView
    private let topContainer: HomeTopContainer = {
        let view = HomeTopContainer()
        return view
    }()
    
    private let todoSection: HomeSection = {
        let todoSection = HomeSection()
        return todoSection
    }()
    
    private let financeSection: HomeSection = {
        let financeSection = HomeSection()
        return financeSection
    }()
    
    // MARK: - View customization
    override func setupViews() {
        populateTodoSectionItem()
        populateFinanceSectionHistory()
        backgroundColor = .white
        
        let contentView = [topContainer, todoSection, financeSection]
        contentView.forEach(addSubview)
        
        topContainer.anchorWithSizeMultiplier(top: topAnchor, left: margins.leftAnchor, bottom: nil, right: margins.rightAnchor, width: nil, height: margins.heightAnchor, multiplier: CGSize(width: 0, height: 0.55))
        
        let paddingTop = screenHeight * 0.025
        todoSection.sectionItem = self.todos
        todoSection.homeSectionLabel.text = "Great task to do"
        todoSection.collectionViewCellColor = UIColor(rgb: 0x00E4B8)
        
        todoSection.anchorWithSizeMultiplier(top: topContainer.bottomAnchor, left: margins.leftAnchor, bottom: nil, right: margins.rightAnchor, padding: UIEdgeInsets(top: paddingTop, left: 0, bottom: 0, right: 0), width: nil, height: margins.heightAnchor, multiplier: CGSize(width: 0, height: 0.21))
        
        
        financeSection.sectionItem = self.finance
        financeSection.homeSectionLabel.text = "Latest finance history"
        financeSection.collectionViewCellColor = UIColor(rgb: 0x36D5FF)
        
        financeSection.anchorWithSizeMultiplier(top: todoSection.bottomAnchor, left: margins.leftAnchor, bottom: nil, right: margins.rightAnchor, width: nil, height: margins.heightAnchor, multiplier: CGSize(width: 0, height: 0.21))
    }
    
    private func populateTodoSectionItem() {
        todos.append(HomeSectionItem(name: "Study Literature", category: "School"))
        todos.append(HomeSectionItem(name: "Do the exercises of math", category: "Home"))
        todos.append(HomeSectionItem(name: "Check the homework", category: "Home"))
        todos.append(HomeSectionItem(name: "Repeat the poetry of Pascoli", category: "Home"))
        todos.append(HomeSectionItem(name: "Study Science", category: "Work"))
    }
    
    private func populateFinanceSectionHistory() {
        finance.append(HomeSectionItem(name: "Breakfast", category: "Food"))
        finance.append(HomeSectionItem(name: "Busway", category: "Transport"))
        finance.append(HomeSectionItem(name: "T-shirt", category: "Shopping"))
        finance.append(HomeSectionItem(name: "Jeans", category: "Shopping"))
        finance.append(HomeSectionItem(name: "Lunch", category: "Food"))
        finance.append(HomeSectionItem(name: "Dinner", category: "Food"))
    }

}
