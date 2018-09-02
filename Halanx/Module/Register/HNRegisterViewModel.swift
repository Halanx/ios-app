//
//  HNRegisterViewModel.swift
//  Halanx
//
//  Created by Shubham Arora on 03/09/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import Foundation


class HNRegisterViewModel {
    
    var registerParamDict = [String: String]()
    var otpParamDict = [String : String]()
    
    /// Generate OTP
    func generateOtp(url: URL, onSucess: @escaping (String)->(), onFailure: @escaping (Error)->()) {
        
        HNRegisterWebService.generateOtp(url: url, param: otpParamDict, onSucess: { (response) in
            
            if let result = response!["result"] as? String {
                
                onSucess(result)
            }
            
        }) { (error) in
            
            onFailure(error)
        }
        
    }
    
    /// Registering User
    func registerUser(url: URL, onSucess: @escaping (String)->(), onFailure: @escaping (Error)->()) {
        
        
    }
    
    func createOtpParamDic(name: String) {
        
        otpParamDict = ["first_name": name]
    }
    
    func createResiterParamDic(firstName: String, lastName: String, phoneNum: String, username: String, password: String, email: String, otp: String) {
        
        registerParamDict = ["username": username,
                             "phone_no": phoneNum,
                             "email": email,
                             "first_name": firstName,
                             "last_name": lastName,
                             "password": password,
                             "otp": otp]
        
    }
    
}




























