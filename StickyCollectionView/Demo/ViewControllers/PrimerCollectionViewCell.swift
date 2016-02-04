//
//  PrimerCollectionViewCell.swift
//  StickyCollectionView
//
//  Created by Bogdan Matveev on 02/02/16.
//  Copyright © 2016 Bogdan Matveev. All rights reserved.
//

import UIKit

class PrimerCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var lessonLabel: UILabel!
    
    var lesson: String? {
        didSet {
            lessonLabel.text = lesson
        }
    }
}
