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
}

// MARK: EndPoint Extension
// Creating & Appending Endpoints to the URL
extension Endpoint {
    
    var endPoint: String {
        
        switch self {
            
        case .userExist:
            
            return "/users/exists/"
            
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
    
    // Get Complete Url
    func completeUrl(endpoint: Endpoint) -> String {
        
        let urlString = "baseurl" + endpoint.endPoint
        return urlString
    }
    
    
}
