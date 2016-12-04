//
//  PrimerViewController.swift
//  StickyCollectionView
//
//  Created by Bogdan Matveev on 02/02/16.
//  Copyright © 2016 Bogdan Matveev. All rights reserved.
//

import UIKit

class PrimerViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let kDemoCell = "primerCell"
    let kCellSizeCoef: CGFloat = 0.8
    let kFirstItemTransform: CGFloat = 0.05
    
    let lessonsArray = ["Create a Hight Quality, High Ranking Search Ad",
        "Evolve Your Ad Campaigns with Programmatic Buying",
        "How Remarketing Keeps Customers Coming Back",
        "Surviving and Thriving on Social Media",
        "Keep Mobile Users Engaged In and Out of Your App",
        "Appeal to Searchers and Search Engines with Seo",
        "Build Your Business Fast with Growth Hacking",
        "Track Your Acquisitions with Digital Metricks"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let stickyLayout = collectionView.collectionViewLayout as! StickyCollectionViewFlowLayout
        stickyLayout.firstItemTransform = kFirstItemTransform
    }
    
    @IBAction func actionClose(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
}

extension PrimerViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lessonsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kDemoCell, for: indexPath) as! PrimerCollectionViewCell
        let lesson = lessonsArray[indexPath.row]
        cell.lesson = lesson
        return cell
    }
}

extension PrimerViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width, height: collectionView.bounds.height * kCellSizeCoef)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: NSInteger) -> CGFloat {
        return 0
    }
}


