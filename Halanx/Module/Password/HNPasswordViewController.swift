//
//  HNPasswordViewController.swift
//  Halanx
//
//  Created by Shubham Arora on 10/08/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class HNPasswordViewController: UIViewController {
    
    @IBOutlet weak var otpViewConstraintX: NSLayoutConstraint!
    @IBOutlet weak var btnBackground: UIButton!
    @IBOutlet weak var viewOtp: HNDesignableView!
    @IBOutlet weak var viewLogo: HNDesignableView!
    @IBOutlet weak var txtPassword: SkyFloatingLabelTextField!
    // MARK: Variables
    fileprivate let passwordWebService = HNPasswordWebService()
    var mobileNum: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        

    }
    
    /// Setting Up UI
    func setUpUI() {
        
        otpViewConstraintX.constant = -(view.frame.width)
        viewOtp.alpha = 0
        viewLogo.alpha = 0
        btnBackground.alpha = 0
        
    }
    
    /// Showing Main Tab Bar
    func showMainTabBar() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            
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
            self.btnBackground.alpha = 0.5
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
    
    // MARK: IBActions
    @IBAction func btnForgotPassAction(_ sender: Any) {
        
        showOtpView()
    }
    
    @IBAction func btnLoginAction(_ sender: Any) {
        
        if mobileNum == "" {
            
            displayAlertMessageWithTitle(titleToDisplay: "Login Error", messageToDisplay: "Enter valid Mobile Number")
            return
        }
        else if (txtPassword.text?.isEmpty)! {
            
            displayAlertMessageWithTitle(titleToDisplay: "Login Error", messageToDisplay: "Enter your Password")
            return
        }
        
        loginAction()
    }
    
    @IBAction func btnBackgroundAction(_ sender: Any) {
        
        removeOptView()
    }
    
    
}

// MARK: Request Protocol
extension HNPasswordViewController: RequestGeneratorProtocol {
    
    func loginAction() {
        
        guard let url = URL(string: completeUrl(endpoint: .logIn())) else {return}
        passwordWebService.createParamDic(username: mobileNum, password: txtPassword.text!)
        passwordWebService.loginAction(url: url, onSucess: { (response) in
            
            if let error = response["error"] as? String {
                
                self.displayAlertMessageWithTitle(titleToDisplay: "Register Error", messageToDisplay: error)
                return
            }
            if let detail = response["non_field_errors"] as? String {
                
                self.displayAlertMessageWithTitle(titleToDisplay: "Register Error", messageToDisplay: detail)
                return
            }
            
            if let key = response["key"] as? String {
                
                HNUserDefaultManager.saveStringValue(value: key, key: Key.authKey)
                HNUserDefaultManager.saveBoolValue(value: true, key: Key.isUserLoggedIn)
                self.showMainTabBar()
            }
            
        }) { (error) in
            
            self.displayAlertMessageWithTitle(titleToDisplay: "Login Error", messageToDisplay: "\(error.localizedDescription)")
        }
    }
}










