//
//  File.swift
//  Aleesha
//
//  Created by Muhammad M. Munir on 09/03/19.
//  Copyright © 2019 Muhammad M. Munir. All rights reserved.
//

import UIKit

extension UIColor {
    
    public class var firstColor: UIColor
    {
        return UIColor(rgb: 0xE0DBEE)
    }
    
    public class var secondColor: UIColor
    {
        return UIColor(rgb: 0x4A4849)
    }
    
    public class var thirdColor: UIColor
    {
        return UIColor(rgb: 0xA6A6A6)
    }
    
    public class var fourthColor: UIColor
    {
        return UIColor(rgb: 0x95926C)
    }
    
    public class var fifthColor: UIColor
    {
        return UIColor(rgb: 0x9A77F8)
    }
    
    // MARK: Create custom init for UIColor with hex color code (rgb)
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    
    // MARK: Create custom init for UIColor with hex color code (rgb) and alpha
    
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: a
        )
    }
    
    convenience init(rgb: Int, a: CGFloat = 1.0) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF,
            a: a
        )
    }
    
}
