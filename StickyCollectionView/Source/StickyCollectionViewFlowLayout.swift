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
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let items = NSArray (array: super.layoutAttributesForElements(in: rect)!, copyItems: true)
        var headerAttributes: UICollectionViewLayoutAttributes?
        
        items.enumerateObjects(using: { (object, idex, stop) -> Void in
            let attributes = object as! UICollectionViewLayoutAttributes
            
            if attributes.representedElementKind == UICollectionElementKindSectionHeader {
                headerAttributes = attributes
            }
            else {
                self.updateCellAttributes(attributes, headerAttributes: headerAttributes)
            }
        })
        return items as? [UICollectionViewLayoutAttributes]
    }
    
    func updateCellAttributes(_ attributes: UICollectionViewLayoutAttributes, headerAttributes: UICollectionViewLayoutAttributes?) {
        let minY = collectionView!.bounds.minY + collectionView!.contentInset.top
        var maxY = attributes.frame.origin.y
        
        if let headerAttributes = headerAttributes {
            maxY -= headerAttributes.bounds.height
        }
        
        let finalY = max(minY, maxY)
        var origin = attributes.frame.origin
        let deltaY = (finalY - origin.y) / attributes.frame.height
        
        if let itemTransform = firstItemTransform {
            let scale = 1 - deltaY * itemTransform
            attributes.transform = CGAffineTransform(scaleX: scale, y: scale)
        }
        
        origin.y = finalY
        attributes.frame = CGRect(origin: origin, size: attributes.frame.size)
        attributes.zIndex = attributes.indexPath.row
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}
