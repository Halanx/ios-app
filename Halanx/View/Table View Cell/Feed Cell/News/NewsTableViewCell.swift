//
//  NewsTableViewCell.swift
//  Halanx
//
//  Created by Shubham Arora on 09/08/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDetail: UILabel!
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var imgNewsFeed: UIImageView!
    @IBOutlet weak var btnReadMore: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

    
    
}
