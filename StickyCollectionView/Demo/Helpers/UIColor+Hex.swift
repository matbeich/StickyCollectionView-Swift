//
//  UIColor.swift
//  StickyCollectionView
//
//  Created by Bogdan Matveev on 02.02.16.
//  Copyright © 2016 Bogdan Matveev. All rights reserved.
//
import UIKit

extension UIColor {
    public class func colorFromHexString(hexString: String) -> UIColor {
        let colorString = hexString.stringByReplacingOccurrencesOfString("#", withString: "").uppercaseString
        let alpha, red, blue, green: Float
        alpha = 1.0
        red = self.colorComponentsFrom(colorString, start: 0, length: 2)
        green = self.colorComponentsFrom(colorString, start: 2, length: 2)
        blue = self.colorComponentsFrom(colorString, start: 4, length: 2)
        return UIColor(colorLiteralRed: red, green: green, blue: blue, alpha: alpha)
    }
    
    private class func colorComponentsFrom(string: NSString, start: Int, length: Int) -> Float {
        NSMakeRange(start, length)
        let subString = string.substringWithRange(NSMakeRange(start, length))
        var hexValue: UInt32 = 0
        NSScanner(string: subString).scanHexInt(&hexValue)
        return Float(hexValue) / 255.0
    }
}
