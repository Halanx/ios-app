//
//  HNPollViewController.swift
//  Halanx
//
//  Created by Shubham Arora on 06/08/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import UIKit
import Contacts


class HNPollViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var btnSubmitHeight: NSLayoutConstraint!
    
    fileprivate let pollCellIdentifier = CellIdentifier.pollCell
    let name = ["Shubham","Nikhil","Akash","Sidhant","Ronak","Di","Raja","Ria","Arushi"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
        fetchContacts()
        
        
    }

    // MARK: IBActions
    @IBAction func btnSubmitAction(_ sender: Any) {
        
        
    }
    
    /// Register Cell Nib
    func registerNib() {
        
        let pollNib = UINib(nibName: CellNib.pollCell, bundle: Bundle.main)
        tableView.register(pollNib, forCellReuseIdentifier: pollCellIdentifier)
        
        tableView.layer.borderWidth = 0.5
        tableView.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func fetchContacts() {
        
        let store = CNContactStore()
        store.requestAccess(for: .contacts) { (granted, err) in
            
            if let error = err {
                
                self.displayAlertMessage(messageToDisplay: "\(error.localizedDescription)")
                return
            }
            
            if granted {
                
                let keys = [CNContactGivenNameKey,CNContactPhoneNumbersKey]
                let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
                
                do {
                    
                    try store.enumerateContacts(with: request, usingBlock: { (contact, stopPointerIfYouWantToStopEmurating ) in
                        
                        print(contact.givenName)
                        print(contact.phoneNumbers.first?.value.stringValue ?? "")
                        
                    })
                }catch {
                    
                    self.displayAlertMessage(messageToDisplay: String(describing: error.localizedDescription))
                }
                
            }else {
                
                print("Access Denied")
            }
        }
    }
    
}



extension HNPollViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: pollCellIdentifier, for: indexPath) as! PollTableViewCell
        
        cell.lblName.text = name[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 45
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
    
}
























