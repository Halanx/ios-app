//
//  HNCommentViewController.swift
//  Halanx
//
//  Created by Shubham Arora on 25/08/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import UIKit
import RSKGrowingTextView

class HNCommentViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var txtComent: RSKGrowingTextView!
    
    fileprivate let commentCell = CellIdentifier.commentCell
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
        setUpUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        
        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    /// Register Cell Nib
    func registerNib() {
        
        let commentNib = UINib(nibName: CellNib.commentCell, bundle: Bundle.main)
        tableView.register(commentNib, forCellReuseIdentifier: commentCell)
    }
    
    /// Stting Up UI
    func setUpUI() {
        
        txtComent.layer.cornerRadius = 10
        txtComent.layer.borderWidth = 0.5
        txtComent.layer.borderColor = UIColor.lightGray.cgColor
    }

}


// MARK: Table View
extension HNCommentViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellComment = tableView.dequeueReusableCell(withIdentifier: commentCell, for: indexPath)
        
        return cellComment
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }

    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
    
}





