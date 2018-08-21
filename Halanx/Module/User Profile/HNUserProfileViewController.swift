//
//  HNUserProfileViewController.swift
//  Halanx
//
//  Created by Shubham Arora on 21/08/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import UIKit

class HNUserProfileViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    fileprivate let photoCell = CellIdentifier.photoTableCell
    //fileprivate let followerCell = CellIdentifier.followerCell
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
        
    }
    
    /// Register Cell Nib
    func registerNib() {
        
        let photoTableNib = UINib(nibName: CellNib.photoTableCell, bundle: Bundle.main)
        tableView.register(photoTableNib, forCellReuseIdentifier: photoCell)
    }


}


//extension HNUserProfileViewController: UITableViewDataSource, UITableViewDelegate {
//    
////    func numberOfSections(in tableView: UITableView) -> Int {
////        
////        return 2
////    }
////    
////    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////        
////        return 1
////    }
////    
////    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        
////        
////    }
////    
////    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
////        
////        return UITableViewAutomaticDimension
//    }
//    
////    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
////        <#code#>
////    }
//    
//}









