//
//  HNMarketPlaceViewController.swift
//  Halanx
//
//  Created by Shubham Arora on 06/08/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import UIKit

class HNMarketPlaceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: IBActions
    @IBAction func btnNotificationClicked(_ sender: Any) {
        
        let notificationVc = HNNotificationViewController.instantiateViewController(fromAppstoryboard: .Main)
        notificationVc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(notificationVc, animated: true)
        
    }
    

}
