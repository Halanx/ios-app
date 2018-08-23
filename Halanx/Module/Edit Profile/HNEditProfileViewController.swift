//
//  HNEditProfileViewController.swift
//  Halanx
//
//  Created by Shubham Arora on 16/08/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import UIKit
import RSKGrowingTextView
import SkyFloatingLabelTextField
import DLRadioButton

class HNEditProfileViewController: UIViewController {

    @IBOutlet weak var imgProfile: HNDesignableImage!
    @IBOutlet weak var txtBio: RSKGrowingTextView!
    @IBOutlet weak var txtEmail: SkyFloatingLabelTextField!
    @IBOutlet weak var txtDOB: SkyFloatingLabelTextField!
    @IBOutlet weak var btnMale: DLRadioButton!
    @IBOutlet weak var btnFemale: DLRadioButton!
    @IBOutlet weak var txtRelation: SkyFloatingLabelTextField!
    @IBOutlet weak var txtAddress: SkyFloatingLabelTextField!
    @IBOutlet weak var txtEducation: SkyFloatingLabelTextField!
    @IBOutlet weak var txtWork: SkyFloatingLabelTextField!
    
    @IBOutlet weak var btnBackground: UIButton!
    @IBOutlet weak var viewRelation: HNDesignableView!
    @IBOutlet weak var viewAddress: HNDesignableView!
    
    @IBOutlet weak var ConstraintRelationX: NSLayoutConstraint!
    
    @IBOutlet weak var ConstraintAddressX: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //changeNavigationTitle(title: "Edit Profile")
        self.title = "Edit Profile"
    }
    
    /// Setiing Up UI
    func setUpUI() {
    
        ConstraintRelationX.constant = -(view.frame.width)
        ConstraintAddressX.constant = -(view.frame.width)
        btnBackground.alpha = 0.0
        self.viewRelation.alpha = 0
        self.viewAddress.alpha = 0
        
        txtRelation.inputAccessoryView = UIView(frame: CGRect.zero)
        txtAddress.inputAccessoryView = UIView(frame: CGRect.zero)
        txtRelation.inputView = UIView(frame: CGRect.zero)
        txtAddress.inputView = UIView(frame: CGRect.zero)
    }

    /// Show Relation View
    func showRelationView() {
        
        ConstraintRelationX.constant = 0
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
            self.viewRelation.alpha = 1.0
            self.btnBackground.alpha = 0.5
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    /// Remove Relation View
    func removeRelationView() {
        
        ConstraintRelationX.constant = -(view.frame.width)
        
        UIView.animate(withDuration: 0.1) {
            self.btnBackground.alpha = 0
            self.viewRelation.alpha = 0
            self.view.layoutIfNeeded()
        }
        
    }
    
    /// Show Address View
    func showAddressView() {
        
        ConstraintAddressX.constant = 0
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
            self.viewAddress.alpha = 1.0
            self.btnBackground.alpha = 0.5
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    /// Remove Address View
    func removeAddressView() {
        
        ConstraintAddressX.constant = -(view.frame.width)
        
        UIView.animate(withDuration: 0.1) {
            self.btnBackground.alpha = 0
            self.viewAddress.alpha = 0
            self.view.layoutIfNeeded()
        }
        
    }
    
    // MARK: IBActions
    @IBAction func btnChangePicClicked(_ sender: Any) {
    }
    
    @IBAction func btnBackgroundClicked(_ sender: Any) {
        
        if ConstraintAddressX.constant == 0 {
            
            removeAddressView()
        }
        else if ConstraintRelationX.constant == 0{
            
            removeRelationView()
        }
        
        
    }
    
}


extension HNEditProfileViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == txtRelation {
            
            
            self.showRelationView()
        }
        else if textField == txtAddress {
            
            self.showAddressView()
        }
        else if textField == txtEducation {
            
            let educationVc = HNEducationDetailViewController.instantiateViewController(fromAppstoryboard: .Main)
            self.view.endEditing(true)
            self.navigationController?.pushViewController(educationVc, animated: true)
        }else if textField == txtWork {
            
            let workVC = HNWorkDetailViewController.instantiateViewController(fromAppstoryboard: .Main)
            self.view.endEditing(true)
            self.navigationController?.pushViewController(workVC, animated: true)
        }
        
    }
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == txtRelation {
            
            return false
        }
        else if textField == txtAddress {
            
            return false
        }
        else {
            
            return true
        }
        
    }
}




