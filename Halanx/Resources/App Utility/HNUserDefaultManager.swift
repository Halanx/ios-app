//
//  HNUserDefaultManager.swift
//  Halanx
//
//  Created by Shubham Arora on 12/08/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import UIKit


struct Key {
    
    static let launchBefore: String = "launchBefore"
    
}

struct HNUserDefaultManager {
    
    
    static func saveStringValue(value: String, key: String) {
        
        userDefault.set(value, forKey: key)
    }
    
    static func getStringValue(key: String) -> String {
        
        if let getString: String = userDefault.string(forKey: key) {
            
            return getString
        }
        
        return ""
    }
    
    static func saveBoolValue(value: Bool, key: String) {
        
        UserDefaults.standard.set(value, forKey: key)
    }
    
    static func getBoolValue(key: String) -> Bool {
        
        return userDefault.bool(forKey:key)
    }
    
}






