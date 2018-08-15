//
//  HNLoginViewController.swift
//  Halanx
//
//  Created by Shubham Arora on 06/08/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin

class HNLoginViewController: UIViewController {

    @IBOutlet weak var imgLogo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    override func viewDidAppear(_ animated: Bool) {
        
        
    }
    
    // MARK: IBActions
    @IBAction func btnContinueAction(_ sender: Any) {
        
        let passVc = HNPasswordViewController.instantiateViewController(fromAppstoryboard: .Main)
        self.navigationController?.pushViewController(passVc, animated: true)
    }
    
    @IBAction func btnFbAction(_ sender: UIButton) {
        
        let loginManager = LoginManager()
        loginManager.logIn(readPermissions: [.publicProfile, .email, .userBirthday], viewController: self) { result in
            
            print(result)
        }
        
    }
    
    
}


















