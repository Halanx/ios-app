//
//  HNAppStoryboard.swift
//  Halanx
//
//  Created by Shubham Arora on 06/08/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import UIKit



enum AppStoryboard: String {
    
    case Main
    case Chat
    case Feed
    case Market
    case Payment
    
    var instance: UIStoryboard {
        
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
    func viewController<T: UIViewController>(viewControllerClass: T.Type) -> T {
        
        let storyboardId = viewControllerClass.storyboardID
        return instance.instantiateViewController(withIdentifier: storyboardId) as! T
        
    }
    
}

extension UIViewController {
    
    class var storyboardID : String {
        
        return "\(self)"
    }
    
    static func instantiateViewController(fromAppstoryboard appStoryboard: AppStoryboard) -> Self {
        
        return appStoryboard.viewController(viewControllerClass: self)
    }
}





