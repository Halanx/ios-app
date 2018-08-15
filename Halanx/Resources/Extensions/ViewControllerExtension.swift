//
//  ViewControllerExtension.swift
//  Halanx
//
//  Created by Shubham Arora on 07/08/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import UIKit


extension UIViewController {
    
    
    func displayAlertMessage(messageToDisplay: String){
        
        let alertController = UIAlertController(title: "Oops", message: messageToDisplay, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action: UIAlertAction) in
            
            // to make action when ok is pressed
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
        
    }
    
    func changeNavigationTitle(title: String) {
        
        self.navigationItem.title = title
        let attrs = [
            NSAttributedStringKey.foregroundColor: UIColor.white,
            NSAttributedStringKey.font: UIFont(name: "HelveticaNeue-Medium", size: 18)!
        ]
        UINavigationBar.appearance().titleTextAttributes = attrs
    }
    
    func displayAlertMessageWithTitle(titleToDisplay : String, messageToDisplay: String){
        
        let alertController = UIAlertController(title: titleToDisplay, message: messageToDisplay, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action : UIAlertAction) in
            
            // to make action when ok is pressed
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
        
    }
    
    func makeToast(message : String) {
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 150, y: self.view.frame.size.height-100, width: 300, height: 45))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 6.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
}
