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
    @IBOutlet weak var btnBackground: UIButton!
    @IBOutlet weak var viewFilter: UIView!
    @IBOutlet weak var ConstraintFilterX: NSLayoutConstraint!
    
    
    fileprivate let neighbourCell = CellIdentifier.neighbourCell

    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
        setUpUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        
        changeNavigationTitle(title: "Neighbour")
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
        
        ConstraintFilterX.constant = -(view.frame.width)
        btnBackground.alpha = 0.0
        self.viewFilter.alpha = 0
        
    }
    
    /// Show Distance View
    func showFilterView() {
        
        ConstraintFilterX.constant = 0
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
            self.viewFilter.alpha = 1.0
            self.btnBackground.alpha = 0.5
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    /// Remove Distance View
    func removeFilterView() {
        
        ConstraintFilterX.constant = -(view.frame.width)
        
        UIView.animate(withDuration: 0.1) {
            self.btnBackground.alpha = 0
            self.viewFilter.alpha = 0
            self.view.layoutIfNeeded()
        }
        
    }

    // MARK: IBActions
    @IBAction func btnFilterTapped(_ sender: Any) {
        
        showFilterView()
        
    }
    
    @IBAction func btnBackgroundClicked(_ sender: Any) {
        
        removeFilterView()
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








