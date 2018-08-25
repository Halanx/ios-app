//
//  HNPastOrderViewController.swift
//  Halanx
//
//  Created by Shubham Arora on 24/08/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import UIKit

protocol OnPastTableProtocol {
    
    func tableReloadData()
}

class HNPastOrderViewController: UIViewController {
    
    @IBOutlet weak var tableView: OrderTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.vc = "Past"
    }


    

}
