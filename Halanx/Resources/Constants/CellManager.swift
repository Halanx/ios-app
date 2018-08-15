//
//  CellManager.swift
//  Halanx
//
//  Created by Shubham Arora on 10/08/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import UIKit


class CellNib {
    
    static let shared = CellNib()
    
    let postCell = "PostTableViewCell"
    
    let newsCell = "NewsTableViewCell"
    
    let messageCell = "MessageTableViewCell"
    
    let pollCell = "PollTableViewCell"
    
    let notificationCell = "NotificationTableViewCell"
    
    let interestCell = "InterestCollectionViewCell"
    
    private init() {}
    
}



class CellIdentifier {
    
    static let shared = CellIdentifier()
    
    let postCell = "cellPost"
    
    let newsCell = "cellNews"
    
    let messageCell = "cellMessage"
    
    let pollCell = "cellPoll"
    
    let notificationCell = "cellNotification"
    
    let interestCell = "cellInterest"
    
    private init() {}
}















