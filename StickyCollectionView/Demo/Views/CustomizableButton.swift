//
//  CustomizableButton.swift
//  StickyCollectionView
//
//  Created by Bogdan Matveev on 02/02/16.
//  Copyright © 2016 Bogdan Matveev. All rights reserved.
//

import UIKit

class CustomizableButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 0
    @IBInspectable var borderWidth: CGFloat = 0
    @IBInspectable var horizontalPadding: CGFloat = 0
    @IBInspectable var borderColor: UIColor?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.masksToBounds = true;
        layer.borderWidth = borderWidth
        layer.cornerRadius = cornerRadius
        
        if let color = borderColor {
            layer.borderColor = color.CGColor
        }
    }
    
    override func intrinsicContentSize() -> CGSize {
        var contentSize = super.intrinsicContentSize()
        contentSize.width += horizontalPadding * 2
        return contentSize
    }
}
