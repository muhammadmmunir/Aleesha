//
//  HomeRootContainer.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 12/03/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import UIKit

class HomeRootContainer: BaseView {

//    private var margins: UILayoutGuide {
//        return safeAreaLayoutGuide
//    }
    
    private var screenSize: CGRect {
        return UIScreen.main.bounds
    }
    
    private var screenHeight: CGFloat {
        return screenSize.height
    }
    
    var quoteText: String? {
        didSet{
            if let quoteText = quoteText {
                topContainer.quoteText = quoteText
            }
        }
    }
    
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
    
    var todos = [HomeSectionItem]()
    var finance = [HomeSectionItem]()

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
    
    override func setupViews() {
        populateTodoSectionItem()
        populateFinanceSectionHistory()
        backgroundColor = .white
        
        setupTopContainer()
        setupTodoSection()
        setupFinanceSection()
    }
    
    private func setupTopContainer() {
        addSubview(topContainer)
        topContainer.translatesAutoresizingMaskIntoConstraints = false
        topContainer.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topContainer.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 0.55).isActive = true
        topContainer.leftAnchor.constraint(equalTo: margins.leftAnchor).isActive = true
        topContainer.rightAnchor.constraint(equalTo: margins.rightAnchor).isActive = true
    }
    
    private func setupTodoSection() {
        addSubview(todoSection)
        
        let paddingTop = screenHeight * 0.025
        todoSection.sectionItem = self.todos
        todoSection.homeSectionLabel.text = "Great task to do"
        todoSection.collectionViewCellColor = UIColor(rgb: 0x00E4B8)
        
        todoSection.translatesAutoresizingMaskIntoConstraints = false
        todoSection.topAnchor.constraint(equalTo: topContainer.bottomAnchor, constant: paddingTop).isActive = true
        todoSection.leftAnchor.constraint(equalTo: margins.leftAnchor).isActive = true
        todoSection.rightAnchor.constraint(equalTo: margins.rightAnchor).isActive = true
        todoSection.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 0.21).isActive = true
    }
    
    private func setupFinanceSection() {
        addSubview(financeSection)
        
        let paddingTop = screenHeight * 0.025
        financeSection.sectionItem = self.finance
        financeSection.homeSectionLabel.text = "Latest finance history"
        financeSection.collectionViewCellColor = UIColor(rgb: 0x36D5FF)
        
        financeSection.translatesAutoresizingMaskIntoConstraints = false
        financeSection.topAnchor.constraint(equalTo: todoSection.bottomAnchor, constant: paddingTop).isActive = true
        financeSection.leftAnchor.constraint(equalTo: margins.leftAnchor).isActive = true
        financeSection.rightAnchor.constraint(equalTo: margins.rightAnchor).isActive = true
        financeSection.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 0.21).isActive = true
    }

}
