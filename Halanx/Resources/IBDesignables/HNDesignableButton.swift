//
//  HNDesignableButton.swift
//  Halanx
//
//  Created by Shubham Arora on 09/08/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import UIKit

@IBDesignable class HNDesignableButton: UIButton {

    // MARK: - Borders
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    // MARK: - Shadow
    
    @IBInspectable var shadowOpacity: Float = 0.0 {
        
        didSet {
            
            self.layer.shadowOpacity = shadowOpacity
        }
    }
    
    @IBInspectable var shadowColor: UIColor = UIColor.clear {
        
        didSet {
            
            self.layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 0.0 {
        
        didSet {
            
            self.layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0, height: 0) {
        
        didSet {
            
            self.layer.shadowOffset = shadowOffset
        }
    }
    
    
    // MARK: Circle Button
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
