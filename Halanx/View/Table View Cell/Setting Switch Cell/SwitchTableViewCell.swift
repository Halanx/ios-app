//
//  SwitchTableViewCell.swift
//  Halanx
//
//  Created by Shubham Arora on 17/08/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {

    
    @IBOutlet weak var switchBtn: UISwitch!
    @IBOutlet weak var lblNotification: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
