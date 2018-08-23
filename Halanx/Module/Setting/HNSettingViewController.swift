//
//  HNSettingViewController.swift
//  Halanx
//
//  Created by Shubham Arora on 17/08/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import UIKit

class HNSettingViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    fileprivate var switchCell = CellIdentifier.switchCell
    fileprivate var notificationCell = CellIdentifier.notificationCell


    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
        
        tableView.tableFooterView = UIView()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        
        //changeNavigationTitle(title: "Setiings")
        self.title = "Settings"
    }
    
    /// Register Nib Cell
    func registerNib() {
        
        let notificationNib = UINib(nibName: CellNib.notificationCell, bundle: Bundle.main)
        tableView.register(notificationNib, forCellReuseIdentifier: notificationCell)
    }

}


extension HNSettingViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (shareArrayText.count + 2)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row < 2 {
            
            let cellSwitch = tableView.dequeueReusableCell(withIdentifier: switchCell, for: indexPath) as! SwitchTableViewCell
            cellSwitch.lblNotification.text = notificationArray[indexPath.row]
            return cellSwitch
            
        }
        else {
            
            let shareCell = tableView.dequeueReusableCell(withIdentifier: notificationCell, for: indexPath) as! NotificationTableViewCell
            shareCell.imgNotification.image = UIImage(named: "\(shareArrayImage[indexPath.row - 2])")
            shareCell.lblDetail.text = shareArrayText[indexPath.row - 2]
            
            return shareCell
           
        }
   
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 44
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
//
}











