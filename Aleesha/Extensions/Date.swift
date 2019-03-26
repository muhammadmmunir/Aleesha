//
//  Date.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 22/03/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import Foundation

extension Date{
    
    static var yesterday: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: Date())!
    }
    
    static var today: Date {
        return Calendar.current.date(byAdding: .day, value: 0, to: Date())!
    }
    
    static var tommorow: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: Date())!
    }
    
}
