//
//  StringExtension.swift
//  Halanx
//
//  Created by Shubham Arora on 07/08/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import Foundation



extension String {
    
    var isValidEmail : Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
}

