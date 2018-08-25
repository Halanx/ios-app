//
//  PeopleLikeTableViewCell.swift
//  Halanx
//
//  Created by Shubham Arora on 22/08/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import UIKit

class PeopleLikeTableViewCell: UITableViewCell {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnView: HNDesignableButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let nib = UINib(nibName: "StatementTableViewCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "cellStatement")
        
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


extension PeopleLikeTableViewCell: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellStatement", for: indexPath)
        cell.textLabel?.text = "Been on my mind very often"
        cell.imageView?.tintColor = UIColor.red
        cell.imageView?.image = #imageLiteral(resourceName: "smile")
        
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        <#code#>
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
    
}



