//
//  HNRegisterWebService.swift
//  Halanx
//
//  Created by Shubham Arora on 03/09/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import Foundation


class HNRegisterWebService {
    
    /// Generate OTP
    class func generateOtp(url: URL,param: [String : String], onSucess: @escaping ([String : Any]?)->(), onFailure: @escaping (Error)->()) {
        
        DispatchQueue.global(qos: .userInteractive).async {
            
            let requestManager = AlamoRequestManager()
            requestManager.requestDataFor(url, methodType: .post, params: param, headerAuth: nil, onSuccess: { (response) in
                
                DispatchQueue.main.async {
                    
                    onSucess(response)
                }
                
            }, onError: { (error) in
                
                DispatchQueue.main.async {
                    
                    onFailure(error!)
                }
            })
            
            
        }
        
    }
    
    /// Register User
    class func registerUser() {
        
        
    }
    
    
}

















