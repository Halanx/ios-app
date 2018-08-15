//
//  HNOnboardingViewController.swift
//  Halanx
//
//  Created by Shubham Arora on 10/08/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import UIKit


class HNOnboardingViewController: UIViewController {

    @IBOutlet weak var carouselView: iCarousel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var btnSkip: UIButton!
    @IBOutlet weak var btnContinue: UIButton!
    @IBOutlet weak var btnArrow: UIButton!
    
    // MARK: Variables
    var nextCarouselIndex : Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCarousel()
        

     
    }

    func configCarousel() {
        
        carouselView.dataSource = self
        carouselView.delegate = self
        
        carouselView.type = .linear
        carouselView.contentMode = .scaleAspectFit
        carouselView.scrollSpeed = 3.0
        carouselView.isPagingEnabled = true
        carouselView.backgroundColor = UIColor.white
        
        self.pageControl.pageIndicatorTintColor = UIColor.lightGray
        self.pageControl.currentPageIndicatorTintColor = UIColor.red
    }
    
    @IBAction func btnSkipAction(_ sender: Any) {
        
        showLogin()
    }
    
    @IBAction func btnArrowAction(_ sender: Any) {
        
        carouselView.scrollToItem(at: nextCarouselIndex, animated: true)

    }
    
    @IBAction func btnContinueAction(_ sender: Any) {
        
        showLogin()
    }
    
    /// Show Login Controller
    func showLogin() {
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            
            let mainTabBarVc = mainStoryboard.instantiateViewController(withIdentifier: "LoginNavigationController") as! UINavigationController
            appDelegate.window?.rootViewController = mainTabBarVc
            
        }
        
    }
    
    /// Check Last Index of Carousel
    func checkLastIndex() {
        
        if carouselView.currentItemIndex == (introImages.count - 1) {
            
            self.btnArrow.alpha = 0.0
            self.btnSkip.alpha = 0.0
            self.btnContinue.alpha = 1.0
        }else {
            
            self.btnArrow.alpha = 1.0
            self.btnSkip.alpha = 1.0
            self.btnContinue.alpha = 0.0
        }
        
    }
    
}


// MARK: Carousel View
extension HNOnboardingViewController: iCarouselDataSource, iCarouselDelegate {
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        
        return introImages.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        
        var imageView: UIImageView!
        
        if view == nil {
            
            imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: carouselView.frame.size.width, height: carouselView.frame.size.height ))
            imageView.layer.masksToBounds = true
            
            
        }else {
            
            imageView = view as! UIImageView
        }
        
        imageView.image = introImages[index]
        
        return imageView
    }
    
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        
        switch option {
        case .spacing:
            return value * 1.025
        case .wrap:
            return 1
        case .visibleItems:
            return 1
        default:
            return value
        }
    }
    
    func carouselDidScroll(_ carousel: iCarousel) {
        
        self.pageControl.currentPage = carousel.currentItemIndex
        checkLastIndex()
        nextCarouselIndex = carousel.currentItemIndex + 1
        if nextCarouselIndex == introImages.count {
            nextCarouselIndex = 0
        }
    }

    
}















