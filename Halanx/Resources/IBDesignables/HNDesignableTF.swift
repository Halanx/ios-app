//
//  HNDesignableTF.swift
//  Halanx
//
//  Created by Shubham Arora on 10/08/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import UIKit

@IBDesignable class HNDesignableTF: UITextField {
    
    
    @IBInspectable var cornerRadius : CGFloat = 0.0 {
        
        didSet {
            
            self.layer.cornerRadius = cornerRadius
            
        }
        
    }
    
    
    @IBInspectable var borderWidth : CGFloat = 0.0 {
        
        didSet {
            
            self.layer.borderWidth = borderWidth
            
        }
        
    }
    
    @IBInspectable var borderColor : UIColor = UIColor.clear {
        
        didSet {
            
            self.layer.borderColor = borderColor.cgColor
            
        }
        
    }
    
    @IBInspectable var leftImage : UIImage? {
        
        didSet {
            
            updateView()
            
        }
        
    }
    
    @IBInspectable var rightImage : UIImage? {
        
        didSet {
            
            updateView()
            
        }
        
    }
    
    
    @IBInspectable var leftPadding : CGFloat = 0.0 {
        
        didSet {
            
            updateView()
            
        }
        
    }
    
    
    func updateView(){
        
        if let image = leftImage {
            leftViewMode = .always
            let imageView = UIImageView(frame: CGRect(x: leftPadding, y: 0, width: 20, height: 20))
            imageView.image = image
            imageView.tintColor = tintColor
            
            var imageWidth = leftPadding + 20
            
            if borderStyle == UITextBorderStyle.none || borderStyle == UITextBorderStyle.line{
                imageWidth = imageWidth + 5
            }
            
            let view = UIView(frame:(CGRect(x: 0, y: 0, width: imageWidth, height: 20)))
            view.addSubview(imageView)
            
            leftView = view
            
            
        }else {
            //If there is no image on left
            leftViewMode =  .always
            let view = UIView(frame:CGRect(x: 0, y: 0, width: 5, height: 20))
            leftView = view
        }
        
        if let image = rightImage {
            
            rightViewMode = .always
            let imageView = UIImageView(frame:CGRect(x: 0, y: 0, width: 20, height: 20))
            imageView.image = image
            
            
            var imageWidth = leftPadding + 20
            
            if borderStyle == UITextBorderStyle.none || borderStyle == UITextBorderStyle.line{
                imageWidth = imageWidth + 5
            }
            
            let view = UIView(frame:(CGRect(x: 0, y: 0, width: imageWidth, height: 20)))
            view.addSubview(imageView)
            
            rightView = view
            
            
        }else {
            
            //If there is no image on right
            rightViewMode = .never
        }
        
        
    }

}
