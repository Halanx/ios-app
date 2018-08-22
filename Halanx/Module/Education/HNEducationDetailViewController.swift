//
//  HNEducationDetailViewController.swift
//  Halanx
//
//  Created by Shubham Arora on 22/08/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import UIKit
import RSKGrowingTextView

class HNEducationDetailViewController: UIViewController {
    
    @IBOutlet weak var txtDescription: RSKGrowingTextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        txtDescription.layer.borderWidth = 1.0
        txtDescription.layer.borderColor = UIColor.red.cgColor
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        changeNavigationTitle(title: "Education Detail")
    }


}
