//
//  OrderTableView.swift
//  Halanx
//
//  Created by Shubham Arora on 24/08/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import UIKit

protocol TableReloadData {
    
    func reloadTableData()
}

class OrderTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    
    fileprivate let orderVoucherCell = CellIdentifier.orderVoucherCell
    var vc: String?
    override func awakeFromNib() {
        registerNib()
        delegate = self
        dataSource = self
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        bouncesZoom = false
        estimatedRowHeight = 90
        rowHeight = UITableViewAutomaticDimension
        
    }
    
    
    
    func registerNib() {
        
        let orderVoucherNib = UINib(nibName: CellNib.orderVoucherCell, bundle: Bundle.main)
        self.register(orderVoucherNib, forCellReuseIdentifier: orderVoucherCell)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellOrderVoucher = tableView.dequeueReusableCell(withIdentifier: orderVoucherCell, for: indexPath) as! OrderVoucherTableViewCell
        
        cellOrderVoucher.configureCell(vc: self.vc!)
        
        return cellOrderVoucher
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
//

}












