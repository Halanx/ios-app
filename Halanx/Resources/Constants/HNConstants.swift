//
//  HNConstants.swift
//  Halanx
//
//  Created by Shubham Arora on 06/08/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import UIKit

// MARK: App Deleagte
let appDelegate = UIApplication.shared.delegate as! AppDelegate

// MARK: Storyboard
let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main) 

// MARK: Images
let introImages = [#imageLiteral(resourceName: "introscreen1"),#imageLiteral(resourceName: "introscreen2"),#imageLiteral(resourceName: "introscreen3"),#imageLiteral(resourceName: "introscreen4")]

// MARK: Userdefault
let userDefault = UserDefaults.standard

// MARK: Settings Constant
let notificationArray: [String] = ["Show me on Halanx", "Notifications"]
let shareArrayText: [String] = ["Connect with Founder", "Like us on Facebook", "Follow us on Twitter", "Follow us on Instagram", "Spread the work"]
let shareArrayImage: [String] = ["halanx_icon","facebook","twitter","insta","share"]






