//
//  HNLoginWebService.swift
//  Halanx
//
//  Created by Shubham Arora on 03/09/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import Foundation


class HNLoginWebService {
    
    class func checkUserExist(url: URL, onSuccess: @escaping (Bool)->(), onFailure: @escaping (Error)->()) {
        
        let requestManager = AlamoRequestManager()
        requestManager.requestDataFor(url, methodType: .get, params: nil, headerAuth: nil, onSuccess: { (response) in
            
            print(response)
            
        }) { (error) in
            
            onFailure(error!)
        }
        
    }
    
    
    
}




