//
//  WelcomeViewController.swift
//  StickyCollectionView
//
//  Created by Bogdan Matveev on 02/02/16.
//  Copyright © 2016 Bogdan Matveev. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var backgroundImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let blurEffect = UIBlurEffect(style: .Dark)
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        visualEffectView.frame = backgroundImageView.bounds
        backgroundImageView.addSubview(visualEffectView)
    }

}
