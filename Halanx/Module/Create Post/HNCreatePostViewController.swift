//
//  HNCreatePostViewController.swift
//  Halanx
//
//  Created by Shubham Arora on 15/08/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import UIKit
import RSKGrowingTextView
import StepSlider

class HNCreatePostViewController: UIViewController {

    @IBOutlet weak var stackImage: UIStackView!
    @IBOutlet weak var stackButton: UIStackView!
    @IBOutlet weak var btnArrow: HNDesignableButton!
    @IBOutlet weak var ConstaraintBottomView: NSLayoutConstraint!
    @IBOutlet weak var imgPost: UIImageView!
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var lblDistance: UILabel!
    @IBOutlet weak var ConstraintDistanceX: NSLayoutConstraint!
    @IBOutlet weak var ConstraintCategoryX: NSLayoutConstraint!
    @IBOutlet weak var viewDistance: HNDesignableView!
    @IBOutlet weak var viewCategory: HNDesignableView!
    @IBOutlet weak var btnBackground: UIButton!
    @IBOutlet weak var txtPostDetail: RSKGrowingTextView!
    @IBOutlet weak var slider: StepSlider!
    
    // MARK: Variables
    var pickerController = UIImagePickerController()
    var lblSliderValue = UILabel()
    
    lazy var lblSlider = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        changeNavigationTitle(title: "Create Post")
    }

    func setUpUI() {
        
        let btnDone = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(btnDoneClicked(_:)))
        btnDone.tintColor = UIColor.red
        navigationItem.rightBarButtonItem = btnDone
        btnDone.isEnabled = false
        
        ConstraintDistanceX.constant = -(view.frame.width)
        ConstraintCategoryX.constant = -(view.frame.width)
        btnBackground.alpha = 0.0
        self.viewDistance.alpha = 0
        self.viewCategory.alpha = 0
        
        txtPostDetail.layer.borderWidth = 1.0
        txtPostDetail.layer.borderColor = UIColor.red.cgColor
        
    }
    
    // MARK: IBActions
    @IBAction func btnDoneClicked(_ sender: UIBarButtonItem) {
        
        
    }
    
    @IBAction func btnArrowAction(_ sender: Any) {
        
        if ConstaraintBottomView.constant == 0 {
            
            stackButton.isHidden = true
            stackImage.isHidden = false
            ConstaraintBottomView.constant = -60
            btnArrow.setImage(#imageLiteral(resourceName: "upArrow"), for: .normal)
            UIView.animate(withDuration: 0.2) {
                
                self.view.layoutIfNeeded()
            }


            
        }else {
            
            ConstaraintBottomView.constant = 0
            stackButton.isHidden = false
            stackImage.isHidden = true
            btnArrow.setImage(#imageLiteral(resourceName: "downArrow"), for: .normal)
            UIView.animate(withDuration: 0.2) {
                
                self.view.layoutIfNeeded()
            }

        }
    }
    
    @IBAction func btnCameraAction(_ sender: Any) {
        
        showActionSheet()
    }
    
    @IBAction func btnCategoryAction(_ sender: Any) {
        
        showCategoryView()
    }
    
    @IBAction func btnDistanceAction(_ sender: Any) {
        
        showDistanceView()
    }
    
    @IBAction func btnProceedAction(_ sender: Any) {
        
        
    }
    
    @IBAction func btnCancelAction(_ sender: Any) {
        
        removeDistanceView()
    }
    
    @IBAction func btnBackgroundAction(_ sender: Any) {
        
        if ConstraintCategoryX.constant == 0 {
            
            removeCategoryView()
        }else if ConstraintDistanceX.constant == 0{
            
            removeDistanceView()
        }
        
    }
    
    @IBAction func sliderDrag(_ sender: Any) {
        
        
    }
    
    /// Show Distance View
    func showDistanceView() {

        ConstraintDistanceX.constant = 0

        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
            self.viewDistance.alpha = 1.0
            self.btnBackground.alpha = 0.5
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    /// Remove Distance View
    func removeDistanceView() {

        ConstraintDistanceX.constant = -(view.frame.width)

        UIView.animate(withDuration: 0.1) {
            self.btnBackground.alpha = 0
            self.viewDistance.alpha = 0
            self.view.layoutIfNeeded()
        }

    }
    
    /// Show Category View
    func showCategoryView() {
        
        ConstraintCategoryX.constant = 0
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
            self.viewCategory.alpha = 1.0
            self.btnBackground.alpha = 0.5
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    /// Remove Category View
    func removeCategoryView() {
        
        ConstraintCategoryX.constant = -(view.frame.width)
        
        UIView.animate(withDuration: 0.1) {
            self.btnBackground.alpha = 0
            self.viewCategory.alpha = 0
            self.view.layoutIfNeeded()
        }
        
    }
    
    /// Action Sheet Camera,Gallery
    func showActionSheet() {
        
        let alertController = UIAlertController(title: "Choose your option", message: nil, preferredStyle: .actionSheet)
        
        let camera = UIAlertAction(title: "Camera", style: .default) { (cameraAction) in
            
            self.openCamera()
        }
        
        let gallery = UIAlertAction(title: "Gallery", style: .default) { (galeryAction) in
            
            self.openGallery()
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(camera)
        alertController.addAction(gallery)
        alertController.addAction(cancel)
        present(alertController, animated: true, completion: nil)
        
    }
    
    
    /// Open Camera
    func openCamera() {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            pickerController.delegate = self
            self.pickerController.sourceType = UIImagePickerControllerSourceType.camera
            pickerController.allowsEditing = false
            pickerController.mediaTypes = UIImagePickerController.availableMediaTypes(for: pickerController.sourceType)!
            self .present(self.pickerController, animated: true, completion: nil)
        }
        else {
            let alertWarning = UIAlertController(title:"You don't have Camera", message: nil, preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alertWarning.addAction(ok)
            self.present(alertWarning, animated: true, completion: nil)
        }
    }
    
    /// Open Gallery
    func openGallery() {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            pickerController.delegate = self
            pickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
            pickerController.allowsEditing = false
            pickerController.mediaTypes = UIImagePickerController.availableMediaTypes(for: pickerController.sourceType)!
            self.present(pickerController, animated: true, completion: nil)
        }
    }
    
    
}


extension HNCreatePostViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        dismiss(animated: true, completion: nil)
        
        var selectedImage : UIImage!
        
        if let img = info[UIImagePickerControllerEditedImage] as? UIImage
        {
            selectedImage = img
        }
        else if let img = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            selectedImage = img
        }
        imgPost.contentMode = .scaleAspectFit
        imgPost.image = selectedImage
        
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        dismiss(animated: true, completion: nil)
        print("picker cancel.")
    }
}














