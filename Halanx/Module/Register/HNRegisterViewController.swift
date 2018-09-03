//
//  HNRegisterViewController.swift
//  Halanx
//
//  Created by Shubham Arora on 25/08/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class HNRegisterViewController: UIViewController {

    @IBOutlet weak var otpViewConstraintX: NSLayoutConstraint!
    @IBOutlet weak var btnBackground: UIButton!
    @IBOutlet weak var viewOtp: HNDesignableView!
    @IBOutlet weak var viewLogo: HNDesignableView!
    @IBOutlet weak var txtFirstName: SkyFloatingLabelTextField!
    @IBOutlet weak var txtLastName: SkyFloatingLabelTextField!
    @IBOutlet weak var txtMobileNum: SkyFloatingLabelTextField!
    @IBOutlet weak var txtPassword: SkyFloatingLabelTextField!
    @IBOutlet weak var txtEmail: SkyFloatingLabelTextField!
    @IBOutlet weak var lblNumber: UILabel!
    @IBOutlet weak var txtOtp: UITextField!
    
    // Variables
    var mobileNum = ""
    let registerWebService = HNRegisterWebService()
    
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
        txtMobileNum.text = self.mobileNum
        txtOtp.textAlignment = .center
    }
    
    /// Show Distance View
    func showOtpView() {
        
        lblNumber.text = txtMobileNum.text
        otpViewConstraintX.constant = 0
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
            self.viewLogo.alpha = 1.0
            self.viewOtp.alpha = 1.0
            self.btnBackground.alpha = 0.5
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    /// Remove Distance View
    func removeOtpView() {
        
        otpViewConstraintX.constant = -(view.frame.width)
        lblNumber.text = ""
        UIView.animate(withDuration: 0.1) {
            self.btnBackground.alpha = 0
            self.viewLogo.alpha = 1.0
            self.viewOtp.alpha = 1.0
            self.view.layoutIfNeeded()
        }
        
    }
    
    /// Checking Textfield is Emply
    func isTextfieldEmpty(textfield: UITextField) -> Bool{
        
        if (textfield.text?.isEmpty)! {
            
            return false
        }
        
        return true
        
    }
    
    // MARK: IBActions
    @IBAction func btnSendOtpAction(_ sender: Any) {
        
        if !isTextfieldEmpty(textfield: txtFirstName) {
            
            displayAlertMessageWithTitle(titleToDisplay: "Register Error", messageToDisplay: "Enter your First Name!")
            return
        }
        else if !isTextfieldEmpty(textfield: txtLastName) {
            
            displayAlertMessageWithTitle(titleToDisplay: "Register Error", messageToDisplay: "Enter your Last Name!")
            return

        }else if !isTextfieldEmpty(textfield: txtEmail) {
            
            displayAlertMessageWithTitle(titleToDisplay: "Register Error", messageToDisplay: "Enter your Email address!")
            return

        }else if !(txtEmail.text?.isValidEmail)! {
            
            displayAlertMessageWithTitle(titleToDisplay: "Register Error", messageToDisplay: "Enter your valid Email address!")
            return
        }else if !isTextfieldEmpty(textfield: txtPassword) {
            
            displayAlertMessageWithTitle(titleToDisplay: "Register Error", messageToDisplay: "Enter your Password!")
            return

        }
        
        getOtp()
    }
    
    @IBAction func btnAlreadyRegistered(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnSubmitAction(_ sender: Any) {
        
        if !isTextfieldEmpty(textfield: txtOtp) {
            
            displayAlertMessageWithTitle(titleToDisplay: "Register Error", messageToDisplay: "Enter OTP send to your Mobile Number")
            return
        }
        registerUser()
    }
    
    @IBAction func btnResendOtpAction(_ sender: Any) {
        
        getOtp()
    }
    @IBAction func btnBackgroundClicked(_ sender: Any) {
        
        removeOtpView()
    }
    
}

// MARK: Request protocol
extension HNRegisterViewController: RequestGeneratorProtocol {
    
    func getOtp() {
        
        guard let mobileNum = txtMobileNum.text,
            let url = URL(string: completeUrl(endpoint: .getOtp()) + "\(mobileNum)/")
            else {return}
        
        /// Creating Param
        registerWebService.createOtpParamDic(name: txtFirstName.text!)
        registerWebService.generateOtp(url: url, onSucess: { (response) in
            
            if response == "success" {
                self.showOtpView()
            }
            
        }) { (error) in
            
            self.displayAlertMessageWithTitle(titleToDisplay: "OTP Error", messageToDisplay: "\(error.localizedDescription)")
        }
    }
    
    func registerUser() {
        
        guard let url = URL(string: completeUrl(endpoint: .registerUser()))
            else {return}
        
        /// Creating Param
        registerWebService.createResiterParamDic(firstName: txtFirstName.text!, lastName: txtLastName.text!, phoneNum: txtMobileNum.text!, username: txtMobileNum.text!, password: txtPassword.text!, email: txtEmail.text!, otp: txtOtp.text!)
        registerWebService.registerUser(url: url, onSucess: { (response) in
            
            if let error = response["error"] as? String {
                
                self.displayAlertMessageWithTitle(titleToDisplay: "Register Error", messageToDisplay: error)
                return
            }
            if let detail = response["detail"] as? String {
                
                self.displayAlertMessageWithTitle(titleToDisplay: "Register Error", messageToDisplay: detail)
                return
            }
            
            if let key = response["key"] as? String {
                
                HNUserDefaultManager.saveStringValue(value: key, key: Key.authKey)
                HNUserDefaultManager.saveBoolValue(value: true, key: Key.isUserLoggedIn)
                self.navigationController?.popViewController(animated: true)
                
            }
        }, onFailure: { (error) in
            
            self.displayAlertMessageWithTitle(titleToDisplay: "Register Error", messageToDisplay: "\(error.localizedDescription)")
            return
            
        }) { (message) in
            
            self.displayAlertMessageWithTitle(titleToDisplay: "Register Error", messageToDisplay: message)
            return
        }
        
        
    }
    
}

// MARK: TextField Delegate
extension HNRegisterViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        var currentText: String!
        
        if textField == txtOtp {
            
            currentText = txtOtp.text ?? ""
        }else {
            
            currentText = txtMobileNum.text ?? ""
        }
        
        guard let stringRange = Range(range, in: currentText) else { return false }
        
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        
        if textField == txtOtp {
            
            return updatedText.count <= 4
        }else {
            
            return updatedText.count <= 10
        }
    }
    
}




























