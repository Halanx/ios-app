//
//  HNPasswordWebService.swift
//  Halanx
//
//  Created by Shubham Arora on 03/09/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import Foundation

class HNPasswordWebService {
    
    var paramDict = [String : String]()
    
    func loginAction(url: URL, onSucess: @escaping ([String :Any])->(), onFailure: @escaping (Error)->()) {
       
        HNUtility.startLoaderAnimating()
        DispatchQueue.global(qos: .userInteractive).async {
            
            let requestManager = AlamoRequestManager()
            requestManager.requestDataFor(url, methodType: .post, params: self.paramDict, headerAuth: false, headerParamAuth: false, onSuccess: { (response) in
                HNUtility.stopLoaderAnimating()
                DispatchQueue.main.async {
                    
                    onSucess(response!)
                }
                
            }) { (error) in
                
                DispatchQueue.main.async {
                    
                    onFailure(error!)
                }
            }
        }
        
    }
    
    /// Generate OTP
    func generateOtp(url: URL, onSucess: @escaping (String)->(), onFailure: @escaping (Error)->()) {
        
        HNUtility.startLoaderAnimating()
        DispatchQueue.global(qos: .userInteractive).async {
            
            let requestManager = AlamoRequestManager()
            requestManager.requestDataFor(url, methodType: .post, params: nil, headerAuth: false, headerParamAuth: false, onSuccess: { (response) in
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
    
    func createParamDic(username: String, password: String) {
        
        paramDict = ["username":"c\(username)",
                     "password": password]
        
    }
    
}
























