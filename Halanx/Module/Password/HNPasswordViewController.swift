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
    @IBOutlet weak var lblCountDown: UILabel!
    
    // MARK: Variables
    fileprivate var count = 300
    fileprivate var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        changeNavigationTitle(title: "Forgot Password")

    }
    
    func setUpUI() {
        
        otpViewConstraintX.constant = -(view.frame.width)
        viewOtp.alpha = 0
        viewLogo.alpha = 0
        btnBackground.alpha = 0
        
    }
    
    func showMainTabBar() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            
            let mainTabBarVc = HNMainTabViewController.instantiateViewController(fromAppstoryboard: .Main)
            appDelegate.window?.rootViewController = mainTabBarVc
            
        }
        
    }
    
    /// Show Otp View
    func showOtpView() {
        
        otpViewConstraintX.constant = 0
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
            self.viewOtp.alpha = 1.0
            self.viewLogo.alpha = 1.0
            self.btnBackground.alpha = 1.0
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    /// Remove Otp View
    func removeOptView() {
        
        otpViewConstraintX.constant = -(view.frame.width)
        
        UIView.animate(withDuration: 0.1) {
            self.btnBackground.alpha = 0
            self.viewOtp.alpha = 0
            self.viewLogo.alpha = 0
            self.view.layoutIfNeeded()
        }
        
    }
    
    /// Add Timer For Countdown
    func addTimer() {
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCountDown), userInfo: nil, repeats: true)
    }
    
    @IBAction func updateCountDown() {
        
        if(count > 0){
            let minutes = String(count / 60)
            let seconds = String(count % 60)
            lblCountDown.text = minutes + ":" + seconds
            count -= 1
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










