//
//  HNMeWebService.swift
//  Halanx
//
//  Created by Shubham Arora on 03/09/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import Foundation


class HNMeWebService {
    
    /// Sign Out
    func signOut(url: URL, onSuccess: @escaping ([String : Any])->(), onFailure: @escaping (Error)->()) {
        
        HNUtility.startLoaderAnimating()
        DispatchQueue.global(qos: .userInteractive).async {
            
            let requestManager = AlamoRequestManager()
            requestManager.requestDataFor(url, methodType: .post, params: nil, headerAuth: true, headerParamAuth: false, onSuccess: { (response) in
                
                DispatchQueue.main.async {
                    
                    onSuccess(response!)
                }
                
            }, onError: { (error) in
                
                DispatchQueue.main.async {
                    
                    print(error!)
                }
            })
            
        }
        
    }
    
}





