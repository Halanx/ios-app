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
    
    fileprivate let photoCell = CellIdentifier.photoTableCell
    fileprivate let photoCollectionCell = CellIdentifier.photoCollectionCell
    fileprivate let postCell = CellIdentifier.postCell
    fileprivate let userInfoCell = CellIdentifier.userInfoCell
    fileprivate let peopleLikeCell = CellIdentifier.peopleLikeCell
    fileprivate let cellPostHeight: CGFloat = 500
    
    var cellExpand:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
        addLeftBarIcon(named: "blue_circle")
        
    }
    
    /// Register Cell Nib
    func registerNib() {
        
        let userInfoNib = UINib(nibName: CellNib.userInfoCell, bundle: Bundle.main)
        tableView.register(userInfoNib, forCellReuseIdentifier: userInfoCell)
        
        let photoTableNib = UINib(nibName: CellNib.photoTableCell, bundle: Bundle.main)
        tableView.register(photoTableNib, forCellReuseIdentifier: photoCell)
        
        let peopleLikeNib = UINib(nibName: CellNib.peopleLikeCell, bundle: Bundle.main)
        tableView.register(peopleLikeNib, forCellReuseIdentifier: peopleLikeCell)
        
        let postNib = UINib(nibName: CellNib.postCell, bundle: Bundle.main)
        tableView.register(postNib, forCellReuseIdentifier: postCell)
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
    
    // MARK: IBActions
    @IBAction func btnViewClicked(_ sender: UIButton) {
        
        let indexPathUpdate = IndexPath(row: 0, section: 2)
        
        if sender.currentTitle == "View less" {
            
            cellExpand = false
            sender.setTitle("View all", for: .normal)
            
        }else {
            
            cellExpand = true
            sender.setTitle("View Less", for: .normal)
        }

        DispatchQueue.main.async { self.tableView.reloadRows(at: [indexPathUpdate], with: UITableViewRowAnimation.none) }
        
        
    }

}


extension HNMeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            let cellUserInfo = tableView.dequeueReusableCell(withIdentifier: userInfoCell, for: indexPath)
            
            return cellUserInfo
        }
        else if indexPath.section == 1 {
            
            let cellPhoto = tableView.dequeueReusableCell(withIdentifier: photoCell, for: indexPath) as! PhotoTableViewCell
            cellPhoto.collectionView.dataSource = self
            cellPhoto.collectionView.delegate = self
            return cellPhoto
            
        }
        else if indexPath.section == 2 {
            
            let cellPeopleLike = tableView.dequeueReusableCell(withIdentifier: peopleLikeCell, for: indexPath) as! PeopleLikeTableViewCell
            cellPeopleLike.tableView.reloadData()
            cellPeopleLike.btnView.addTarget(self, action: #selector(btnViewClicked(_:)), for: .touchUpInside)
            if cellExpand {
                
                cellPeopleLike.btnView.setTitle("View less", for: .normal)
            }
            else {
                
                cellPeopleLike.btnView.setTitle("View all", for: .normal)
            }
            
            return cellPeopleLike
        }
        else {
            
            let cellPost = tableView.dequeueReusableCell(withIdentifier: postCell, for: indexPath)
            
            return cellPost
            
        }
        

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 1 {
            
            return 150
        }
        else if indexPath.section == 2 {
            
            if cellExpand {
                
                return 400
            }else {
                
                return 240
            }
            
        }
        else {
            
            return UITableViewAutomaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 10
    }

//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
    
}

extension HNMeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: photoCollectionCell, for: indexPath) as! PhotoCollectionViewCell
        
        if indexPath.row == 2 {
            
            cell.btnSeeAll.isHidden = false
        }else {
            
            cell.btnSeeAll.isHidden = true
        }
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.size.width/2, height: 150)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        return UIEdgeInsets(top: 5, left: 10, bottom: 0, right: 10)
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        <#code#>
//    }
    
}



