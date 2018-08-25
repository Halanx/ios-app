//
//  HNRegisterViewController.swift
//  Halanx
//
//  Created by Shubham Arora on 25/08/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import UIKit

class HNRegisterViewController: UIViewController {

    @IBOutlet weak var otpViewConstraintX: NSLayoutConstraint!
    @IBOutlet weak var btnBackground: UIButton!
    @IBOutlet weak var viewOtp: HNDesignableView!
    @IBOutlet weak var viewLogo: HNDesignableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "REGISTER"
        setUpUI()
    }

    /// Setting Up UI
    func setUpUI() {
        
        otpViewConstraintX.constant = -(view.frame.width)
        viewOtp.alpha = 0
        viewLogo.alpha = 0
        btnBackground.alpha = 0
        
    }

}
