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
    
    fileprivate var marketCell = CellIdentifier.marketTableCell
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    /// Register Cell Nib
//    func registerNib() {
//
//        let marketTableNib = UINib(nibName: CellNib.marketTableCell, bundle: Bundle.main)
//        tableView.register(marketTableNib, forCellReuseIdentifier: marketCell)
//
//    }
//
    // MARK: IBActions
    @IBAction func btnNotificationClicked(_ sender: Any) {
        
        let notificationVc = HNNotificationViewController.instantiateViewController(fromAppstoryboard: .Main)
        notificationVc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(notificationVc, animated: true)
        
    }
    
    @IBAction func btnHcashAction(_ sender: Any) {
        
        
    }
    
    @IBAction func btnOrderAction(_ sender: Any) {
        
        print("Order Clicked")
    }
    

}

//// MARK: Table View
//extension HNMarketPlaceViewController: UITableViewDataSource, UITableViewDelegate {
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        
//        return 1
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        
//        return 2
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        let cell = tableView.dequeueReusableCell(withIdentifier: marketCell, for: indexPath)
//        
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        
//        return 100
//    }
//    
////    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
////        <#code#>
////    }
////
//}

















