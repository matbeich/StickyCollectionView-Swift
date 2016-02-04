//
//  CornerViewController.swift
//  StickyCollectionView
//
//  Created by Bogdan Matveev on 02/02/16.
//  Copyright © 2016 Bogdan Matveev. All rights reserved.
//

import UIKit

class CornerViewController: UIViewController {
    
    let kCellHeight: CGFloat = 120.0
    let kItemSpace: CGFloat = -20.0
    let kDemoCell = "cornerCell"
    
    let citiesArray = ["Bangkok", "Barcelona", "Beijing", "Istanbul", "Kiev", "Kyoto", "London", "Madrid", "Moscow", "New York", "Paris", "Prague", "Rio", "Rome", "St.Petersburg", "Tokyo", "Venice", "Vienna"]
    let colorsArray = ["EE5464", "DC4352", "FD6D50", "EA583F", "F6BC43", "8DC253", "4FC2E9", "3CAFDB", "5D9CEE", "4B89DD", "AD93EE", "977BDD", "EE87C0", "D971AE", "903FB1", "9D56B9", "227FBD", "2E97DE"]
    
    @IBAction func actionClose(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}

extension CornerViewController: UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return citiesArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(kDemoCell, forIndexPath: indexPath) as! CornerCollectionViewCell
        
        let city: String = citiesArray[indexPath.row]
        let hexString = colorsArray[indexPath.row]
        let color = UIColor.colorFromHexString(hexString)
                
        cell.city = city
        cell.color = color
        return cell
    }
}

extension CornerViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(CGRectGetWidth(view.bounds), kCellHeight)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: NSInteger) -> CGFloat {
        return kItemSpace
    }
}
