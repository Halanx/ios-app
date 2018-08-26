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
    fileprivate var shareCell = CellIdentifier.shareCell


    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        
        //changeNavigationTitle(title: "Setiings")
        self.title = "Settings"
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
            
            let cellShare = tableView.dequeueReusableCell(withIdentifier: shareCell, for: indexPath) as! SettingShareTableViewCell
            cellShare.imgSocial.image = UIImage(named: shareArrayImage[indexPath.row - 2])
            cellShare.lblSocial.text = shareArrayText[indexPath.row - 2]
            return cellShare
        
        }
   
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
//
}











