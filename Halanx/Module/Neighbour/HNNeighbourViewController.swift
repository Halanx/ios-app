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
    
    
    fileprivate let neighbourCell = CellIdentifier.neighbourCell

    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
        setUpUI()
    }

    /// Register Cell Nib
    func registerNib() {
        
        let messageNib = UINib(nibName: CellNib.neighbourCell, bundle: Bundle.main)
        tableView.register(messageNib, forCellReuseIdentifier: neighbourCell)
    }

    /// Setting Up UI
    func setUpUI() {
        
        let btnFilter = UIBarButtonItem(image: #imageLiteral(resourceName: "interest"), style: .plain, target: self, action: #selector(btnFilterTapped(_:)))
        btnFilter.tintColor = UIColor.black
        navigationItem.rightBarButtonItem = btnFilter
    }

    // MARK: IBActions
    @IBAction func btnFilterTapped(_ sender: Any) {
        
        
    }
}

// MARK: Table View
extension HNNeighbourViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: neighbourCell, for: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 80
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let userProfileVc = HNUserProfileViewController.instantiateViewController(fromAppstoryboard: .Main)
        self.navigationController?.pushViewController(userProfileVc, animated: true)
        
    }
    
}








