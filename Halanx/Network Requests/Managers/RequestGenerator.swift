//
//  RequestGenerator.swift
//  Halanx
//
//  Created by Shubham Arora on 03/09/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import Foundation
import UIKit

var BaseUrl = "https://api.halanx.com"

enum Endpoint {
    
    case userExist()
    case getOtp()
    case registerUser()
    case logIn()
    case loginWithOtp()
    case logOut()
}

// MARK: EndPoint Extension
// Creating & Appending Endpoints to the URL
extension Endpoint {
    
    var endPoint: String {
        
        switch self {
            
        case .userExist:
            
            return "/users/exists/"
        
        case .getOtp:
            
            return "/users/get_otp/"
            
        case .registerUser:
            
            return "/users/register/"
        
        case .logIn:
            
            return "/rest-auth/login/"
            
        case .loginWithOtp:
            
            return "/users/login_otp/"
            
        case .logOut:
            
            return "/rest-auth/logout/"
        }
        
    }
    
    
}

// MARK: Reguest Generator Protocol
// Header Param
protocol RequestGeneratorProtocol {
    
    var headerParams : [String : String] {get}
    
}

// MARK: Request Generator Protocol Extension
extension RequestGeneratorProtocol {
    
    var headerParams : [String : String] {
        
        get {
            
            let headerDictionary = [
                "Content-Type" : "application/json"
            ]
            
            return headerDictionary
        }
    }
    
    var headerAuthParam: [String : String] {
        
        get {
            
            let headerDictionary = [
                "Authorization" : HNUserDefaultManager.getStringValue(key: Key.authKey)
            ]
            
            return headerDictionary
        }
    }
    
    var headerParamWithAuth: [String : String] {
        
        get {
            
            let headerDictionary = [
                 "Content-Type" : "application/json",
                 "Authorization" : "Token \(HNUserDefaultManager.getStringValue(key: Key.authKey))"
            ]
            
            return headerDictionary
        }
    }
    
    // Get Complete Url
    func completeUrl(endpoint: Endpoint) -> String {
        
        let urlString = "\(BaseUrl)" + endpoint.endPoint
        return urlString
    }
    
    
}
