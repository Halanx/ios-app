//
//  HNUtility.swift
//  Halanx
//
//  Created by Shubham Arora on 06/08/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import Foundation



class HNUtility: NSObject {

    
    class func isInternetAvailable() -> Bool {
        
        let reachability : Reachability = Reachability.forInternetConnection()
        let networkStatus: Int = reachability.currentReachabilityStatus().rawValue
        
        if(networkStatus == 0) {
            print("The Internet connection appears to be offline.")
            return false;
        }
        else {
            return true
        }
    }
    
    class func startLoaderAnimating() {
        
        DispatchQueue.main.async(execute:{
            MBProgressHUD.showAdded(to: appDelegate.window!, animated: true)
            
        })
        
    }
    
    class func stopLoaderAnimating() {
        
        DispatchQueue.main.async(execute: {
            MBProgressHUD.hide(for: appDelegate.window!, animated: false)
        })
        
    }
    
    
}




