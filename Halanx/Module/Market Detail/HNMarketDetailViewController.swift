//
//  HNMarketDetailViewController.swift
//  Halanx
//
//  Created by Shubham Arora on 18/08/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import UIKit
import StretchHeader


class HNMarketDetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate let tableViewEstimateHeight: CGFloat = 320
    fileprivate let cellViewAboutHeight: CGFloat = 120
    fileprivate let cellViewAddressHeight: CGFloat = 110
    fileprivate let cellViewVoucherHeight: CGFloat = 90
    fileprivate let cellClaimHeight: CGFloat = 50
    fileprivate let cellPostHeight: CGFloat = 500
    fileprivate let postCell = CellIdentifier.postCell
    fileprivate let voucherCell = CellIdentifier.voucherCell
    fileprivate let addressCell = CellIdentifier.addressCell
    fileprivate let claimCell = CellIdentifier.claimCell
    fileprivate let aboutCell = CellIdentifier.aboutCell
    
    
    var headerView : StretchHeader!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
        setupHeaderView()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        changeNavigationTitle(title: "BTW")
        
        tableView.estimatedRowHeight = tableViewEstimateHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        
    }
    
    /// Set Up UI
    func setUpUI() {
        
        let btnFilter = UIBarButtonItem(image: #imageLiteral(resourceName: "heart"), style: .plain, target: self, action: #selector(btnHeartTapped(_:)))
        btnFilter.tintColor = UIColor.black
        navigationItem.rightBarButtonItem = btnFilter
        
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
        
        tableView.tableHeaderView = headerView
        
        let imgLogo = UIImageView()
        imgLogo.frame = CGRect(x: 20, y: headerView.frame.size.height - 70, width: 60, height: 60)
        imgLogo.backgroundColor = UIColor.black
        imgLogo.image = UIImage(named: "btwLogo")
        headerView.addSubview(imgLogo)
        
        let lblComapny = UILabel()
        lblComapny.text = "BTW"
        lblComapny.textColor = UIColor.white
        lblComapny.frame = CGRect(x: 88, y: headerView.frame.size.height - 70, width: headerView.frame.size.width - 88, height: 15)
        lblComapny.textAlignment = .left
        headerView.addSubview(lblComapny)
        
        let lblLocation = UILabel()
        lblLocation.text = "Delhi"
        lblLocation.textColor = UIColor.white
        lblLocation.frame = CGRect(x: 88, y: headerView.frame.size.height - 50, width: headerView.frame.size.width - 88, height: 15)
        lblLocation.textAlignment = .left
        headerView.addSubview(lblLocation)
    }
    
    /// Register Cell Nib
    func registerNib() {
        
        let postNib = UINib(nibName: CellNib.postCell, bundle: Bundle.main)
        tableView.register(postNib, forCellReuseIdentifier: postCell)
        
        let voucherNib = UINib(nibName: CellNib.voucherCell, bundle: Bundle.main)
        tableView.register(voucherNib, forCellReuseIdentifier: voucherCell)
        
        let addressNib = UINib(nibName: CellNib.addressCell, bundle: Bundle.main)
        tableView.register(addressNib, forCellReuseIdentifier: addressCell)
        
        let aboutNib = UINib(nibName: CellNib.aboutCell, bundle: Bundle.main)
        tableView.register(aboutNib, forCellReuseIdentifier: aboutCell)
    }
    
    // MARK: IBActions
    @IBAction func btnBackAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnClaimClicked(_ sender: Any) {
        
        let claimVc = HNClaimViewController.instantiateViewController(fromAppstoryboard: .Market)
        self.navigationController?.pushViewController(claimVc, animated: true)
    }
    
    
    @IBAction func btnCartClicked(_ sender: Any) {
        
        let cartVc = HNCartViewController.instantiateViewController(fromAppstoryboard: .Market)
        self.navigationController?.pushViewController(cartVc, animated: true)
    }
    
    @IBAction func btnHeartTapped(_ sender: Any) {
        
        
    }
    
}


// MARK: Table View
extension HNMarketDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.section == 0 {
            
            let cellAbout = tableView.dequeueReusableCell(withIdentifier: aboutCell, for: indexPath) as! AboutTableViewCell
            
            return cellAbout
        }else if indexPath.section == 1 {
            
            let cellAddress = tableView.dequeueReusableCell(withIdentifier: addressCell, for: indexPath) as! AddressTableViewCell
            
            return cellAddress
            
        }else if indexPath.section == 2 {
            
            let cellClaim = tableView.dequeueReusableCell(withIdentifier: claimCell, for: indexPath) as! ClaimTableViewCell
            cellClaim.btnClaim.addTarget(self, action: #selector(btnClaimClicked(_:)), for: .touchUpInside)
            return cellClaim
        }else if indexPath.section == 3 {
            
            let cellVoucher = tableView.dequeueReusableCell(withIdentifier: voucherCell, for: indexPath) as! VouchersTableViewCell
            
            return cellVoucher
            
            
        }else {
            
            
            let cell = tableView.dequeueReusableCell(withIdentifier: postCell, for: indexPath)
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            
            return cellViewAboutHeight
        }else if indexPath.section == 1 {
            
            return cellViewAddressHeight
        }else if indexPath.section == 2 {
            
            return cellClaimHeight
        }else if indexPath.section == 3 {
            
            return cellViewVoucherHeight
        }else {
            
            return cellPostHeight
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 10
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        headerView.updateScrollViewOffset(scrollView)

        
    }
    
}



