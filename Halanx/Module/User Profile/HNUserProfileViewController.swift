//
//  HNUserProfileViewController.swift
//  Halanx
//
//  Created by Shubham Arora on 21/08/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import UIKit
import StretchHeader

class HNUserProfileViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    fileprivate let photoCell = CellIdentifier.photoTableCell
    fileprivate let photoCollectionCell = CellIdentifier.photoCollectionCell
    fileprivate let postCell = CellIdentifier.postCell
    fileprivate let userInfoCell = CellIdentifier.userInfoCell
    
    var headerView : StretchHeader!
    let btnFollow = HNDesignableButton()
    let lblName = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
        setupHeaderView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpUI()
        changeNavigationTitle(title: "User Info")
    }
    
    /// Register Cell Nib
    func registerNib() {
        
        let userInfoNib = UINib(nibName: CellNib.userInfoCell, bundle: Bundle.main)
        tableView.register(userInfoNib, forCellReuseIdentifier: userInfoCell)
        
        let photoTableNib = UINib(nibName: CellNib.photoTableCell, bundle: Bundle.main)
        tableView.register(photoTableNib, forCellReuseIdentifier: photoCell)
        
        let postNib = UINib(nibName: CellNib.postCell, bundle: Bundle.main)
        tableView.register(postNib, forCellReuseIdentifier: postCell)
    }

    func setUpUI() {
        
        let btnMessage = UIBarButtonItem(image: #imageLiteral(resourceName: "messageUnSelect"), style: .plain, target: self, action: #selector(btnMessageClicked(_:)))
        btnMessage.tintColor = UIColor.black
        self.navigationItem.rightBarButtonItem = btnMessage
        
    }

    /// Set Up Table Header View
    func setupHeaderView() {
        
        let options = StretchHeaderOptions()
        options.position = .underNavigationBar
        
        headerView = StretchHeader()
        headerView.stretchHeaderSize(headerSize: CGSize(width: view.frame.size.width, height: 300),
                                     imageSize: CGSize(width: view.frame.size.width, height: 300),
                                     controller: self,
                                     options: options)
        headerView.imageView.image = UIImage(named: "download")
        
        lblName.frame = CGRect(x: 20, y: headerView.frame.size.height - 30, width: self.view.frame.size.width - 40, height: 20)
        lblName.text = "Sidhant"
        lblName.font = UIFont(name: "HelveticaNeue-Medium", size: 17)
        lblName.textColor = UIColor.white
        headerView.addSubview(lblName)
        
        tableView.tableHeaderView = headerView

    }
    
    // MARK: IBActions
    @IBAction func btnMessageClicked(_ sender: Any) {
        
        
    }
    
}


extension HNUserProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            let cellUserInfo = tableView.dequeueReusableCell(withIdentifier: userInfoCell, for: indexPath) as! UserInfoTableViewCell
            
            cellUserInfo.progressBar.alpha = 1.0
            cellUserInfo.lblPercent.alpha = 1.0
            cellUserInfo.lblProfileStrength.alpha = 1.0
            
            return cellUserInfo
        }
        else if indexPath.section == 1 {
            
            let cellPhoto = tableView.dequeueReusableCell(withIdentifier: photoCell, for: indexPath) as! PhotoTableViewCell
            cellPhoto.collectionView.dataSource = self
            cellPhoto.collectionView.delegate = self
            return cellPhoto
            
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

extension HNUserProfileViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
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







