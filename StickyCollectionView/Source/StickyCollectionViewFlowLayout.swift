//
//  StickyCollectionViewFlowLayout.swift
//  StickyCollectionView
//
//  Created by Bogdan Matveev on 02/02/16.
//  Copyright © 2016 Bogdan Matveev. All rights reserved.
//

import UIKit

class StickyCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    var firstItemTransform: CGFloat?
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let items = NSArray (array: super.layoutAttributesForElementsInRect(rect)!, copyItems: true)
        var headerAttributes: UICollectionViewLayoutAttributes?
        
        items.enumerateObjectsUsingBlock { (object, idex, stop) -> Void in
            let attributes = object as! UICollectionViewLayoutAttributes
            
            if attributes.representedElementKind == UICollectionElementKindSectionHeader {
                headerAttributes = attributes
            }
            else {
                self.updateCellAttributes(attributes, headerAttributes: headerAttributes)
            }
        }
        return items as? [UICollectionViewLayoutAttributes]
    }
    
    func updateCellAttributes(attributes: UICollectionViewLayoutAttributes, headerAttributes: UICollectionViewLayoutAttributes?) {
        let minY = CGRectGetMinY(collectionView!.bounds) + collectionView!.contentInset.top
        var maxY = attributes.frame.origin.y
        
        if let headerAttributes = headerAttributes {
            maxY -= CGRectGetHeight(headerAttributes.bounds)
        }
        
        let finalY = max(minY, maxY)
        var origin = attributes.frame.origin
        let deltaY = (finalY - origin.y) / CGRectGetHeight(attributes.frame)
        
        if let itemTransform = firstItemTransform {
            let scale = 1 - deltaY * itemTransform
            attributes.transform = CGAffineTransformMakeScale(scale, scale)
        }
        
        origin.y = finalY
        attributes.frame = CGRect(origin: origin, size: attributes.frame.size)
        attributes.zIndex = attributes.indexPath.row
    }
    
    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true
    }
}
