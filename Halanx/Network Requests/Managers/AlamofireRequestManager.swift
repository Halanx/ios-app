//
//  AlamofireRequestManager.swift
//  Halanx
//
//  Created by Shubham Arora on 03/09/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import Foundation
import Alamofire


struct AlamoRequestManager: RequestGeneratorProtocol {
    func requestDataFor(_ strURL : URLConvertible, methodType : HTTPMethod, params : [String : Any]?,headerAuth: Bool, headerParamAuth: Bool,
                        onSuccess:@escaping ([String: Any]?) -> Void,
                        onError:@escaping (Error?) -> Void ){
        var encode:ParameterEncoding = JSONEncoding.default
        if methodType == .get {
            encode = URLEncoding.default
        }
        var headerDict = [String : String]()
        
        if headerAuth {
            
            headerDict = headerAuthParam
        }
        else if headerParamAuth {
            
            headerDict = headerParamWithAuth
        }
        else{
            
            headerDict = headerParams
        }
        
        print("header dict::\(headerDict)")
        
        Alamofire.request(strURL, method: methodType, parameters: params, encoding: encode, headers: headerDict).responseJSON{(response) in
            
            switch response.result{
            case .success(let value):
                print(value)
                let responseDict = response.result.value as? [String: Any]
                onSuccess(responseDict)
            case .failure(let error):
                print(error)
                onError(error)
            }
        }
        
    }
}



























