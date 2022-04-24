//
//  UIColor+Ex.swift
//  Template
//
//  Created by Lam Nguyen on 4/24/22.
//

import UIKit


public extension UIColor {
    /**
     The six-digit hexadecimal representation of color of the form #RRGGBB.
     - parameter hex6: Six-digit hexadecimal value.
     */
    convenience init(hex hexValue: UInt32, alpha alph: CGFloat = 1.0) {
        let red = CGFloat((hexValue & 0xFF0000) >> 16) / CGFloat(255)
        let green = CGFloat((hexValue & 0x00FF00) >> 8) / CGFloat(255)
        let blue = CGFloat(hexValue & 0x0000FF) / CGFloat(255)
        self.init(red: red, green: green, blue: blue, alpha: alph)
    }
    
    func toImage(_ size: CGSize = CGSize(width: 8, height: 8)) -> UIImage? {
        if #available(iOS 10.0, *) {
            return UIGraphicsImageRenderer(size: size).image { (rendererContext) in
                self.setFill()
                rendererContext.fill(CGRect(origin: .zero, size: size))
            }
        } else {
            // Fallback on earlier versions
            let rect = CGRect(origin: CGPoint.zero, size: size)
            UIGraphicsBeginImageContextWithOptions(size, false, 0)
            self.setFill()
            UIRectFill(rect)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return image
        }
    }
}
