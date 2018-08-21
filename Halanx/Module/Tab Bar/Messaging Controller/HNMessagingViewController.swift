//
//  HNMessagingViewController.swift
//  Halanx
//
//  Created by Shubham Arora on 06/08/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import UIKit

class HNMessagingViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    fileprivate let messageCell = CellIdentifier.messageCell
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
        // Do any additional setup after loading the view.
    }

    /// Register Cell Nib
    func registerNib() {
        
        let messageNib = UINib(nibName: CellNib.messageCell, bundle: Bundle.main)
        tableView.register(messageNib, forCellReuseIdentifier: messageCell)
    }
   
    // MARK: IBActions
    @IBAction func btnNeighbourAction(_ sender: Any) {
        
        let neighbourVc = HNNeighbourViewController.instantiateViewController(fromAppstoryboard: .Chat)
        neighbourVc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(neighbourVc, animated: true)
        
    }
    

}


// MARK: Table View
extension HNMessagingViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: messageCell, for: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 80
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
    
}






















