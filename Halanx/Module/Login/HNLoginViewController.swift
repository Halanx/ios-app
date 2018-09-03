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
    
    override func viewWillDisappear(_ animated: Bool) {
        
        self.view.endEditing(true) 
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
        
    }
    
    
    @IBAction func btnFbAction(_ sender: UIButton) {
        
        let loginManager = LoginManager()
        loginManager.logIn(readPermissions: [.publicProfile, .email, .userBirthday], viewController: self) { result in
            
            print(result)
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    
}

// MARK: Request protocol
extension HNLoginViewController: RequestGeneratorProtocol {
    
    
    /// Checking User Exist
    func checkUserExists() {
        
        if (txtMobileNumber.text?.isEmpty)! {
            
            self.displayAlertMessageWithTitle(titleToDisplay: "Login Error", messageToDisplay: "Please Enter your Mobile Number")
            return
        }
        
        guard let mobileNum = txtMobileNumber.text,
            let url = URL(string: completeUrl(endpoint: .userExist()) + "\(mobileNum)")
            else {return}
        
        HNLoginWebService.checkUserExist(url: url, onSuccess: { (response) in
            
            if response == "False" {
                
                let registerVc = HNRegisterViewController.instantiateViewController(fromAppstoryboard: .Main)
                registerVc.mobileNum = mobileNum
                self.navigationController?.pushViewController(registerVc, animated: true)
                
            }else {
                
                let passVc = HNPasswordViewController.instantiateViewController(fromAppstoryboard: .Main)
                passVc.mobileNum = mobileNum
                self.navigationController?.pushViewController(passVc, animated: true)
            }
            
        }) { (error) in
            
            self.displayAlertMessageWithTitle(titleToDisplay: "Error", messageToDisplay: "\(error.localizedDescription)")
        }
        
    }
    
}


// MARK: TextField Delegate
extension HNLoginViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = txtMobileNumber.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        return updatedText.count <= 10
    }
    
}














