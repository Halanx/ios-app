//
//  HNViewAllMarketViewController.swift
//  Halanx
//
//  Created by Shubham Arora on 17/08/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import UIKit

class HNViewAllMarketViewController: UIViewController {

    lazy var searchBar = UISearchBar(frame: CGRect.zero)
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    fileprivate var viewAllCell = CellIdentifier.viewAllCell
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
        setUpUI()
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        
        self.searchBar.endEditing(true)
    }
    
    /// Set Up UI
    func setUpUI() {
        
        searchBar.placeholder = "Search"
        searchBar.delegate = self
        searchBar.barTintColor = UIColor.red
        searchBar.sizeToFit()
        self.navigationItem.titleView = searchBar
    }

    /// Regiter Cell Nib
    func registerNib() {
        
        let viewAllNib = UINib(nibName: CellNib.viewAllCell, bundle: Bundle.main)
        collectionView.register(viewAllNib, forCellWithReuseIdentifier: viewAllCell)
    }

}


// MARK: Search Bar
extension HNViewAllMarketViewController: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {

        searchBar.endEditing(true)
        searchBar.showsCancelButton = false
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        
        self.searchBar.showsCancelButton = true
    }
    
}


// MARK: Collection View
extension HNViewAllMarketViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: viewAllCell, for: indexPath) as! ViewAllCollectionViewCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.view.frame.size.width, height: collectionView.frame.size.height/3.5)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//
//        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        <#code#>
//    }
    
}


















