//
//  OrderVoucherTableViewCell.swift
//  Halanx
//
//  Created by Shubham Arora on 24/08/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import UIKit

class OrderVoucherTableViewCell: UITableViewCell {

    @IBOutlet weak var lblOrder: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var lblCompany: UILabel!
    @IBOutlet weak var btnRedeem: UIButton!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblSuccess: UILabel!
    @IBOutlet weak var lblCode: UILabel!
    @IBOutlet weak var btnRedeemed: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(vc: String) {
        
        if vc == "OnGoing"{
            
            lblCode.alpha = 0
            btnRedeemed.alpha = 0
            btnRedeem.alpha = 1.0
            lblSuccess.alpha = 1.0
            
        }else {
            
            lblCode.alpha = 1.0
            btnRedeemed.alpha = 1.0
            btnRedeem.alpha = 0
            lblSuccess.alpha = 0
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
