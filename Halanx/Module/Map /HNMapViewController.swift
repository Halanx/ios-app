//
//  HNMapViewController.swift
//  Halanx
//
//  Created by Shubham Arora on 15/08/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class HNMapViewController: UIViewController {

    @IBOutlet weak var mapView: GMSMapView!
    var camera = GMSCameraPosition()
    
    override func viewDidLoad() {
        super.viewDidLoad()

                let camera = GMSCameraPosition.camera(withLatitude: 27.17, longitude:  78.04, zoom: 12.0)
                mapView.camera = camera
        
                let marker = GMSMarker()
                marker.position = CLLocationCoordinate2D(latitude: 27.173891, longitude: 78.042068)
        marker.map = mapView
    }


    // MARK: IBACtions

    @IBAction func btnConfirmLocationClicked(_ sender: Any) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            
            let mainTabBarVc = mainStoryboard.instantiateViewController(withIdentifier: "HNMainTabViewController") as! HNMainTabViewController
            appDelegate.window?.rootViewController = mainTabBarVc
            
        }
    }
}
