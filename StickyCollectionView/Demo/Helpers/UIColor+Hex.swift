//
//  UIColor.swift
//  StickyCollectionView
//
//  Created by Bogdan Matveev on 02.02.16.
//  Copyright © 2016 Bogdan Matveev. All rights reserved.
//
import UIKit

extension UIColor {
    public class func colorFromHexString(_ hexString: String) -> UIColor {
        let colorString = hexString.replacingOccurrences(of: "#", with: "").uppercased() as NSString
        let alpha, red, blue, green: CGFloat
        alpha = 1.0
        red = CGFloat(self.colorComponentsFrom(colorString, start: 0, length: 2))
        green = CGFloat(self.colorComponentsFrom(colorString, start: 2, length: 2))
        blue = CGFloat(self.colorComponentsFrom(colorString, start: 4, length: 2))
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    fileprivate class func colorComponentsFrom(_ string: NSString, start: Int, length: Int) -> Float {
        NSMakeRange(start, length)
        let subString = string.substring(with: NSMakeRange(start, length))
        var hexValue: UInt32 = 0
        Scanner(string: subString).scanHexInt32(&hexValue)
        return Float(hexValue) / 255.0
    }
}
