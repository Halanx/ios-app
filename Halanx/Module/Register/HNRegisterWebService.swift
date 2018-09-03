//
//  HNRegisterWebService.swift
//  Halanx
//
//  Created by Shubham Arora on 03/09/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import Foundation


class HNRegisterWebService {
    
    var registerParamDict = [String: Any]()
    var otpParamDict = [String : String]()
    
    /// Generate OTP
    func generateOtp(url: URL, onSucess: @escaping (String)->(), onFailure: @escaping (Error)->()) {
        
        DispatchQueue.global(qos: .userInteractive).async {
            HNUtility.startLoaderAnimating()
            let requestManager = AlamoRequestManager()
            requestManager.requestDataFor(url, methodType: .post, params: self.otpParamDict, headerAuth: nil, onSuccess: { (response) in
                HNUtility.stopLoaderAnimating()
                DispatchQueue.main.async {
                    
                    if let result = response!["result"] as? String {
                        
                        onSucess(result)
                    }
                    
                }
                
            }, onError: { (error) in
                
                DispatchQueue.main.async {
                    
                    onFailure(error!)
                }
            })
            
            
        }
        
    }
    
    /// Register User
    func registerUser(url: URL, onSucess: @escaping ([String : Any])->(), onFailure: @escaping (Error)->(), message: @escaping (String)->()) {
        
        DispatchQueue.global(qos: .userInteractive).async {
            HNUtility.startLoaderAnimating()
            let requestManager = AlamoRequestManager()
            requestManager.requestDataFor(url, methodType: .post, params: self.registerParamDict, headerAuth: nil, onSuccess: { (response) in
                HNUtility.stopLoaderAnimating()
                
                DispatchQueue.main.async {
                    
                    if response == nil {
                        
                        message("Wrong OTP!")
                        return
                    }
                    
                    onSucess(response!)
                    
                }
                
            }, onError: { (error) in
                
                DispatchQueue.main.async {
                    
                    onFailure(error!)
                }
            })
        }
    }
    
    
    func createOtpParamDic(name: String) {
        
        otpParamDict = ["first_name": name]
    }
    
    func createResiterParamDic(firstName: String, lastName: String, phoneNum: String, username: String, password: String, email: String, otp: String) {
        
        registerParamDict = ["username": "c\(username)",
                             "phone_no": phoneNum,
                             "email": email,
                             "first_name": firstName,
                             "last_name": lastName,
                             "password": password,
                             "otp": Int(otp)!]
        
    }
    
}

















