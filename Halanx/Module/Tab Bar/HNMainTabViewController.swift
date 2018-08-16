//
//  HNMainTabViewController.swift
//  Halanx
//
//  Created by Shubham Arora on 06/08/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import UIKit

class HNMainTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabbarItemName()
        

    }

    // MARK: - Set item Name in TabBarController
    func setTabbarItemName() {
        
        self.selectedIndex = 2
    
        self.tabBar.tintColor = UIColor.red
        self.tabBar.unselectedItemTintColor = UIColor.black
//        
//        self.tabBar.items![0].titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -5)
//        self.tabBar.items![1].titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -5)
//        self.tabBar.items![2].titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -5)
//        self.tabBar.items![3].titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -5)
//        self.tabBar.items![4].titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -5)
        
    }

}
