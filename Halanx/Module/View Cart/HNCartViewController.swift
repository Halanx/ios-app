//
//  HNCartViewController.swift
//  Halanx
//
//  Created by Shubham Arora on 21/08/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import UIKit

class HNCartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        
        changeNavigationTitle(title: "Cart")
    }
    
    // MARK: IBActions
    @IBAction func btnPayClicked(_ sender: Any) {
        
        let paymentOptionVC = HNPaymentOptionsViewController.instantiateViewController(fromAppstoryboard: .Payment)
        self.navigationController?.pushViewController(paymentOptionVC, animated: true)
        
    }
    
}
