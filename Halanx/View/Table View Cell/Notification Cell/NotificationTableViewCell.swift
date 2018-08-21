//
//  NotificationTableViewCell.swift
//  Halanx
//
//  Created by Shubham Arora on 15/08/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imgNotification: UIImageView!
    @IBOutlet weak var lblDetail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
