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

    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}




