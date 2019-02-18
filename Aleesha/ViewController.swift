//
//  ViewController.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 14/02/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var quoteLabel: UILabel!
    
    let quoteCollections: [String] = [
    "Only I can change my life. No one can do it for me.",
    "Life is 10% what happens to you and 90% how you react to it.",
    "With the new day comes new strength and new thoughts.",
    "The past cannot be changed. The future is yet in your power.",
    "It does not matter how slowly you go as long as you do not stop"
        // Copyright © from www.brainyquote.com
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTodayDate()
        setRandomQuote()
    }
    
    func setTodayDate() {
        let day = getTodayDateWithFormat("dd")
        let month = getTodayDateWithFormat("MMM")
        let year = getTodayDateWithFormat("yyyy")
        
        dateLabel.text = day
        monthLabel.text = month
        yearLabel.text = year
    }
    
    func getTodayDateWithFormat(_ format: String) -> String {
        
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let dateType = dateFormatter.string(from: now)
        
        return dateType
    }

    func setRandomQuote() {
        let quoteIndex = Int.random(in: 0...4)
        var quote = quoteCollections[quoteIndex]
        quote = addQuotationMarkTo(text: quote)
        quoteLabel.text = quote
    }
    
    func addQuotationMarkTo(text: String) -> String {
        return "\"" + text + "\""
    }

}

