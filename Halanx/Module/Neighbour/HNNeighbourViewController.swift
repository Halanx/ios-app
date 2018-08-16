//
//  HNNeighbourViewController.swift
//  Halanx
//
//  Created by Shubham Arora on 16/08/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import UIKit

class HNNeighbourViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    fileprivate let messageCell = CellIdentifier.messageCell

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    /// Register Cell Nib
    func registerNib() {
        
        let messageNib = UINib(nibName: CellNib.messageCell, bundle: Bundle.main)
        tableView.register(messageNib, forCellReuseIdentifier: messageCell)
    }


}