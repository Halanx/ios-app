//
//  HNFeedViewController.swift
//  Halanx
//
//  Created by Shubham Arora on 06/08/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import UIKit

class HNFeedViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnCreatePost: UIButton!
    
    fileprivate let postCellIdentifier = CellIdentifier.shared.postCell
    fileprivate let newsCellIdentifier = CellIdentifier.shared.newsCell
    fileprivate let tableViewEstimateHeight: CGFloat = 320
    fileprivate let postCellHeight: CGFloat = 500
    fileprivate let newsCellHeight: CGFloat = 400
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addLeftBarIcon(named: "blue_circle")
        registerNib()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        tableView.estimatedRowHeight = tableViewEstimateHeight
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    func registerNib() {
        
        let postNib = UINib(nibName: "PostTableViewCell", bundle: Bundle.main)
        tableView.register(postNib, forCellReuseIdentifier: postCellIdentifier)
        
        let newsNib = UINib(nibName: "NewsTableViewCell", bundle: Bundle.main)
        tableView.register(newsNib, forCellReuseIdentifier: newsCellIdentifier)
    }
    
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
 
    
    @IBAction func btnCreatePostAction(_ sender: Any) {
        
        let createPostVc = HNCreatePostViewController.instantiateViewController(fromAppstoryboard: .Main)
        createPostVc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(createPostVc, animated: true)
        
    }
    

    
}


// MARK: Scroll View
extension HNFeedViewController: UIScrollViewDelegate {

    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
        btnCreatePost.isHidden = true
    }
    //  Converted to Swift 4 by Swiftify v4.1.6781 - https://objectivec2swift.com/
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            scrollingFinish()
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollingFinish()
    }
    
    func scrollingFinish() {
        //enter code here
        
        btnCreatePost.isHidden = false
    }
}


// MARK: Table View
extension HNFeedViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 15
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.section == 0 {
            
            let cell2 = tableView.dequeueReusableCell(withIdentifier: postCellIdentifier, for: indexPath) as! PostTableViewCell
            
            return cell2
        }
        else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: newsCellIdentifier, for: indexPath) as! NewsTableViewCell

                return cell
        }
    
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            
            return postCellHeight
        }else {
            
            return newsCellHeight
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 10
    }

//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
    
    
}







