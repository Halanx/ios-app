//
//  HNMeViewController.swift
//  Halanx
//
//  Created by Shubham Arora on 06/08/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import UIKit

class HNMeViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addLeftBarIcon(named: "blue_circle")
        
    }

    /// Adding Profile Image to left of navigation bar
    func addLeftBarIcon(named:String) {
        
        let logoImage = UIImage.init(named: named)
        let logoImageView = UIImageView.init(image: logoImage)
        let imageItem = UIBarButtonItem.init(customView: logoImageView)
        let widthConstraint = logoImageView.widthAnchor.constraint(equalToConstant: 40)
        let heightConstraint = logoImageView.heightAnchor.constraint(equalToConstant: 40)
        heightConstraint.isActive = true
        widthConstraint.isActive = true
        logoImageView.layer.cornerRadius = 20
        logoImageView.layer.masksToBounds = true
        navigationItem.leftBarButtonItem =  imageItem
    }
    
    // MARK: IBActions
    @IBAction func btnSettingAction(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Options", message: nil, preferredStyle: .actionSheet)
        
        let setting = UIAlertAction(title: "Settings", style: .default) { (settingAction) in
            
            self.openSetting()
        }
        
        let help = UIAlertAction(title: "Help", style: .default) { (helpAction) in
            
            self.openHelp()
        }
        
        let signOut = UIAlertAction(title: "Sign Out", style: .destructive) { (signOutAction) in
            
            self.signOutAction()
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(setting)
        alertController.addAction(help)
        alertController.addAction(signOut)
        alertController.addAction(cancel)
        present(alertController, animated: true, completion: nil)
        
    }
    
    @IBAction func btnEditProfileAction(_ sender: Any) {
        
        let editVc = HNEditProfileViewController.instantiateViewController(fromAppstoryboard: .Main)
        editVc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(editVc, animated: true)
    }
    
    /// Sign Out Action
    func signOutAction() {
        
        let alertController = UIAlertController(title: "Sign Out!", message: "Are you sure to logout?", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default) { (okAction) in
            
            
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(ok)
        alertController.addAction(cancel)
        present(alertController, animated: true, completion: nil)
    }
    
    /// Open Setting Controller
    func openSetting() {
        
        let settingVc = HNSettingViewController.instantiateViewController(fromAppstoryboard: .Main)
        self.navigationController?.pushViewController(settingVc, animated: true)
    }
    
    /// Open Help
    func openHelp() {
        
        
    }
    

}
