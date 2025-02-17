//
//  HNLoginWebService.swift
//  Halanx
//
//  Created by Shubham Arora on 03/09/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import Foundation


class HNLoginWebService {
    
    class func checkUserExist(url: URL, onSuccess: @escaping (String)->(), onFailure: @escaping (Error)->()) {
        
        HNUtility.startLoaderAnimating()
        DispatchQueue.global(qos: .userInteractive).async {
            
            let requestManager = AlamoRequestManager()
            requestManager.requestDataFor(url, methodType: .get, params: nil, headerAuth: false, headerParamAuth: false, onSuccess: { (response) in
                HNUtility.stopLoaderAnimating()
                if let result =  response!["exists"] as? String {
                    
                    DispatchQueue.main.async {
                        
                        onSuccess(result)
                    }
                    
                }
                
            }) { (error) in
                
                DispatchQueue.main.async {
                    
                    onFailure(error!)
                }
            }
            
        }

    }
    
    
    
}




