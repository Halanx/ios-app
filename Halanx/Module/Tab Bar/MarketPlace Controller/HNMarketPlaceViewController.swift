//
//  HNMarketPlaceViewController.swift
//  Halanx
//
//  Created by Shubham Arora on 06/08/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import UIKit

class HNMarketPlaceViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var viewHeader: UIView!
    @IBOutlet weak var lblHeaderTitle: UILabel!
    @IBOutlet weak var btnHeaderViewAll: UIButton!
    @IBOutlet weak var lblHeaderDetail: UILabel!
    
    fileprivate var marketTableCell = CellIdentifier.marketTableCell
    fileprivate var marketCollectionCell = CellIdentifier.marketCollectionCell
    fileprivate let tableSectionHeaderHeight: CGFloat = 80.0
    fileprivate let tableSectionFooterHeight: CGFloat = 20.0
    fileprivate let tableViewEstimateHeight: CGFloat = 250
    fileprivate let cellHeight: CGFloat = 180

    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
        setUpUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        tableView.estimatedRowHeight = tableViewEstimateHeight
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    
    /// Register Cell Nib
    func registerNib() {

        let marketTableNib = UINib(nibName: CellNib.marketTableCell, bundle: Bundle.main)
        tableView.register(marketTableNib, forCellReuseIdentifier: marketTableCell)

    }
    
    /// Setting up UI
    func setUpUI() {
        
        self.navigationController?.view.backgroundColor = UIColor.white

    }

    // MARK: IBActions
    @IBAction func btnNotificationClicked(_ sender: Any) {
        
        let notificationVc = HNNotificationViewController.instantiateViewController(fromAppstoryboard: .Market)
        notificationVc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(notificationVc, animated: true)
        
    }
    
    @IBAction func btnHcashAction(_ sender: Any) {
        
        
    }
    
    @IBAction func btnOrderAction(_ sender: Any) {
        
        print("Order Clicked")
    }
    
    @IBAction func btnViewAllCliecked(_ sender: Any) {
        
        let viewAllVc = HNViewAllMarketViewController.instantiateViewController(fromAppstoryboard: .Market)
        self.navigationController?.pushViewController(viewAllVc, animated: true)
    }
    

}

// MARK: Table View
extension HNMarketPlaceViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: marketTableCell, for: indexPath) as! MarketTableViewCell
        cell.collectionView.dataSource = self
        cell.collectionView.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return tableSectionHeaderHeight
    }
    
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        
//        return tableSectionFooterHeight
//    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as! HeaderTableViewCell
        cell.backgroundColor = UIColor.white
        cell.btnViewAll.addTarget(self, action: #selector(btnViewAllCliecked(_:)), for: .touchUpInside)
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
//
}


extension HNMarketPlaceViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: marketCollectionCell, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.size.width/1.5, height: collectionView.frame.size.height)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        return UIEdgeInsets(top: 5, left: 10, bottom: 0, right: 10)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let marketDetailVc = HNMarketDetailViewController.instantiateViewController(fromAppstoryboard: .Market)
        marketDetailVc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(marketDetailVc, animated: true)
    }
    
}
















