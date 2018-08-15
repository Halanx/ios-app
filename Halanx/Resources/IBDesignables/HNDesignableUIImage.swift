//
//  HNDesignableUIImage.swift
//  Halanx
//
//  Created by Shubham Arora on 06/08/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import UIKit

@IBDesignable class HNDesignableImage: UIImageView {
    
    // MARK: Border
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        
        didSet {
            
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        
        didSet {
            
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    // MARK: Circle Image
    @IBInspectable var circleImage: Bool = false {
        
        didSet {
            
            if circleImage == false {
                
                self.layer.cornerRadius = self.frame.width
                
            }else {
                
                self.layer.cornerRadius = self.frame.width/2
                self.layer.masksToBounds = true
            }
        }
    }
    
}
