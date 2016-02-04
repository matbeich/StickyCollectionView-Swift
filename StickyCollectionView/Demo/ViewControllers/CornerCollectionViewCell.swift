//
//  CornerCollectionViewCell.swift
//  StickyCollectionView
//
//  Created by Bogdan Matveev on 02/02/16.
//  Copyright © 2016 Bogdan Matveev. All rights reserved.
//

import UIKit

class CornerCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var backingView: UIView!
    
    var city: String? {
        didSet {
            cityLabel.text = city
        }
    }
    
    var color: UIColor? {
        didSet {
            backingView.backgroundColor = color
        }
    }
    
    override func awakeFromNib() {
        backingView.layer.cornerRadius = 12
        backingView.layer.masksToBounds = true
    }
    
}
