//
//  HNOrderViewController.swift
//  Halanx
//
//  Created by Shubham Arora on 24/08/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import UIKit

class HNOrderViewController: UIViewController {


    @IBOutlet weak var onGoingContainer: UIView!
    @IBOutlet weak var pastContainer: UIView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Order"
        
        
        
    }

    // MARK: IBActions
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            
            onGoingContainer.alpha = 1.0
            pastContainer.alpha = 0
            
            
        }else {
            
            pastContainer.alpha = 1.0
            onGoingContainer.alpha = 0
            
        }
        
    }
    

}
