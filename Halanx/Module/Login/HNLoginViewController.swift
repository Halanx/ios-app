//
//  HNLoginViewController.swift
//  Halanx
//
//  Created by Shubham Arora on 06/08/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin
import SkyFloatingLabelTextField

class HNLoginViewController: UIViewController {

    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var txtMobileNumber: SkyFloatingLabelTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkUserLoggedIn()
        
        
        
    }

    override func viewDidAppear(_ animated: Bool) {
        
        
    }
    
    /// Setiing up UI
    func setUpUI() {
        
        txtMobileNumber.textAlignment = .center
    }
    
    /// Checking User logged In
    func checkUserLoggedIn() {
        
        if HNUserDefaultManager.getBoolValue(key: Key.isUserLoggedIn) {
            HNUtility.startLoaderAnimating()
            showMainTabBar()
        }else {
            
            setUpUI()
        }
        
    }
    
    /// Showing Main Tab Bar
    func showMainTabBar() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            
            HNUtility.stopLoaderAnimating()
            let mainTabBarVc = HNMainTabViewController.instantiateViewController(fromAppstoryboard: .Main)
            
            appDelegate.window?.rootViewController = mainTabBarVc
            
        }
        
    }
    
    // MARK: IBActions
    @IBAction func btnContinueAction(_ sender: Any) {
        
        checkUserExists()
//        let passVc = HNPasswordViewController.instantiateViewController(fromAppstoryboard: .Main)
//        self.navigationController?.pushViewController(passVc, animated: true)
    }
    
    
    
    @IBAction func btnFbAction(_ sender: UIButton) {
        
        let loginManager = LoginManager()
        loginManager.logIn(readPermissions: [.publicProfile, .email, .userBirthday], viewController: self) { result in
            
            print(result)
        }
        
    }
    
    
}

extension HNLoginViewController: RequestGeneratorProtocol {
    
    
    /// Checking User Exist
    func checkUserExists() {
        
        if (txtMobileNumber.text?.isEmpty)! {
            
            return
        }
        
        guard let mobileNum = txtMobileNumber.text,
            let url = URL(string: completeUrl(endpoint: .userExist()) + "\(mobileNum)")
            else {return}
        
        HNLoginWebService.checkUserExist(url: url, onSuccess: { (response) in
            
            
        }) { (error) in
            
            self.displayAlertMessageWithTitle(titleToDisplay: "Error", messageToDisplay: "\(error.localizedDescription)")
        }
        
    }
    
}


extension HNLoginViewController: UITextFieldDelegate {
    
    
    
}














