//
//  HNPasswordViewController.swift
//  Halanx
//
//  Created by Shubham Arora on 10/08/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import UIKit

class HNPasswordViewController: UIViewController {
    
    @IBOutlet weak var otpViewConstraintX: NSLayoutConstraint!
    @IBOutlet weak var btnBackground: UIButton!
    @IBOutlet weak var viewOtp: HNDesignableView!
    @IBOutlet weak var viewLogo: HNDesignableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        otpViewConstraintX.constant = -(view.frame.width)
        
    }
    
    func showMainTabBar() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            
            let mainTabBarVc = mainStoryboard.instantiateViewController(withIdentifier: "HNMainTabViewController") as! HNMainTabViewController
            appDelegate.window?.rootViewController = mainTabBarVc
            
        }
        
    }
    
    func showOtpView() {
        
        otpViewConstraintX.constant = 0
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
            self.viewOtp.alpha = 1.0
            self.viewLogo.alpha = 1.0
            self.btnBackground.alpha = 1.0
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func removeOptView() {
        
        otpViewConstraintX.constant = -(view.frame.width)
        
        UIView.animate(withDuration: 0.1) {
            self.btnBackground.alpha = 0
            self.viewOtp.alpha = 0
            self.viewLogo.alpha = 0
            self.view.layoutIfNeeded()
        }
        
    }
    
    // MARK: IBActions
    @IBAction func btnForgotPassAction(_ sender: Any) {
        
        showOtpView()
    }
    
    @IBAction func btnLoginAction(_ sender: Any) {
        
        showMainTabBar()
    }
    
    @IBAction func btnBackgroundAction(_ sender: Any) {
        
        removeOptView()
    }
    
    
}










