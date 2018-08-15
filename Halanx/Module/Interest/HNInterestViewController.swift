//
//  HNInterestViewController.swift
//  Halanx
//
//  Created by Shubham Arora on 16/08/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import UIKit

class HNInterestViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    fileprivate var interestCell = CellIdentifier.shared.interestCell
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
        // Do any additional setup after loading the view.
    }

    func registerNib() {
        
        let interestNib = UINib(nibName: CellNib.shared.interestCell, bundle: Bundle.main)
        collectionView.register(interestNib, forCellWithReuseIdentifier: interestCell)
    }


}


// MARK: Collection View
extension HNInterestViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: interestCell, for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 0, height: 0)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        <#code#>
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        <#code#>
//    }
    
}




















