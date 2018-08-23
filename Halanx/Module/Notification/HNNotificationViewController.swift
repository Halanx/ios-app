//
//  HNNotificationViewController.swift
//  Halanx
//
//  Created by Shubham Arora on 15/08/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import UIKit

class HNNotificationViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var notificationCell = CellIdentifier.notificationCell

    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //changeNavigationTitle(title: "Notifications")
        self.title = "Notifications"
    }
    
    /// Registering Cell Nib
    func registerNib() {
        
        let notificationNib = UINib(nibName: CellNib.notificationCell, bundle: Bundle.main)
        tableView.register(notificationNib, forCellReuseIdentifier: notificationCell)
        
    }


}

// MARK: Table View
extension HNNotificationViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: notificationCell, for: indexPath) as! NotificationTableViewCell
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 60
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
//
}




















