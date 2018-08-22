//
//  UserInfoTableViewCell.swift
//  Halanx
//
//  Created by Shubham Arora on 22/08/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import UIKit

class UserInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblProfileStrength: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var lblPercent: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        progressBar.transform = CGAffineTransform(scaleX: 1, y: 4)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
